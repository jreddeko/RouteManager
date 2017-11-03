using RouteManagement.ViewModels.CustomerViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using PagedList;
using RouteManagement.ViewModels;
using RouteManagement.Exceptions;
using Wddc.Services.EdiOrdering;
using Wddc.Core.Entities.EdiOrdering.Customers;
using Wddc.Core.Entities.EdiOrdering.Routes;
using Wddc.Services;
using Wddc.Core;

namespace RouteManagement.Controllers
{
    [Authorize]
    public class CustomerController : Controller
    {
        private IRouteService _routeService;
        private ICustomerSettingService _customerSettingService;
        private ICustomerSetupStateService _customerSetupStateService;

        public CustomerController(IRouteService routeService, ICustomerSettingService customerSettingService,
            ICustomerSetupStateService customerSetupStateService)
        {
            _routeService = routeService;
            _customerSettingService = customerSettingService;
            _customerSetupStateService = customerSetupStateService;
        }

        [HttpGet]
        public ActionResult Index(IndexViewModel model)
        {
            var customers = _customerSetupStateService.GetAll(
                setupStateId: model.SearchSetupStateId ?? 0,
                routeId: model.SearchRouteId ?? 0,
                hasShippingCharge: model.SearchShippingChargeId ?? -1,
                hasFinancialHold: model.SearchFinancialHoldId ?? -1,
                delayedBillingId: model.SearchDelayedBillingId ?? -1,
                petFoodId: model.SearchPetFoodId ?? -1,
                page: model.Page ?? 1,
                pageSize: 25,
                sort: model.SortId ?? 0,
                search: model.Search);

            model.Customers = customers;

            model.AvailableSortOptions = CustomerSettingSortType.CustomerId.ToSelectList(true).ToList();

            model.AvailableDelayedBillingOptions = CustomerSettingOptionType.DecideOnOrder.ToSelectList(false).ToList();
            model.AvailableDelayedBillingOptions.Insert(0, new SelectListItem { Text = "All", Value = "-1" });

            model.AvailablePetFoodOptions = CustomerSettingOptionType.DecideOnOrder.ToSelectList(false).ToList();
            model.AvailablePetFoodOptions.Insert(0, new SelectListItem { Text = "All", Value = "-1" });

            model.AvailableShippingChargeOptions = CustomerSettingOptionType.DecideOnOrder.ToSelectList(false, new int[] { 3 }).ToList();
            model.AvailableShippingChargeOptions.Insert(0, new SelectListItem { Text = "All", Value = "-1" });

            model.AvailableFinancialHoldOptions = CustomerSettingOptionType.DecideOnOrder.ToSelectList(false, new int[] { 3 }).ToList();
            model.AvailableFinancialHoldOptions.Insert(0, new SelectListItem { Text = "All", Value = "-1" });

            model.AvailableSetupStateOptions = SetupState.Complete.ToSelectList(false).ToList();
            model.AvailableSetupStateOptions.Insert(0, new SelectListItem { Text = "All", Value = "0" });

            model.AvailableRouteOptions = _routeService.GetAllRoutes()
                .Select(v => v as BaseEntity)
                .ToSelectList(p => (p as RouteDTO).Return(v => v.Description + ": #" + v.RouteNumber, String.Empty))
                .ToList();
            model.AvailableRouteOptions.Insert(0, new SelectListItem { Text = "All", Value = "0" });

            return View(model);
        }

        //[Authorize(Roles = "Client Service Representative, Director of Client Services, IT")]
        [HttpPost]
        public ActionResult Add(AddViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = _customerSettingService
                    .AddNewCustomerSettings(model.CustomerId,
                        Int32.Parse(model.RouteDropDownList.SelectedValue),
                        Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                        model.PetFoodMoney,
                        model.ShippingCharge,
                        Int32.Parse(model.DelayedBillingDropDownList.SelectedValue)
                );
                return RedirectToAction("Edit", new { id = result.CustomerId });
            }
            return View(model);
        }

        //[Authorize(Roles = "Client Service Representative, Director of Client Services, IT")]
        [HttpGet]
        public ActionResult Add(string id)
        {
            var customer = _customerSetupStateService.GetByID(id);
            if (customer == null)
                throw new ArgumentException(String.Format("Customer: '{0}' not found.", id));
            if (customer.SetupState == SetupState.Complete)
                throw new CustomerRouteException(String.Format("Customer: '{0}' has already been added to a route.", id));
            if (customer.SetupState == SetupState.PendingShippingSetup)
                throw new CustomerRouteException(String.Format("Customer: '{0}' required shipping setup.", id));

            var model = new ViewModels.CustomerViewModels.AddViewModel()
            {
                DelayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = _customerSettingService
                        .GetCustomerSettingsOptions()
                        .Select(db => new SelectListItem()
                        {
                            Text = db.Name,
                            Value = db.CustomerSettingOptionID.ToString(),
                        }),
                    SelectedValue = "1",
                },

                PetFoodDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = _customerSettingService
                        .GetCustomerSettingsOptions()
                        .Select(db => new SelectListItem()
                        {
                            Text = db.Name,
                            Value = db.CustomerSettingOptionID.ToString(),
                        }),
                    SelectedValue = "1",
                },
                RouteDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = _routeService.GetAllRoutes()
                        .Select(r => new SelectListItem()
                        {
                            Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                            Value = r.RouteID.ToString(),
                        }),
                    SelectedValue = null,
                },
                CustomerId = customer.Id,
                CustomerName = customer.Information.CustomerName,
                PetFoodMoney = 475.00m,
                ShippingCharge = false,
            };
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            var customer = _customerSetupStateService.GetByID(id);
            if (customer == null)
                return HttpNotFound();
            var customerSettings = _customerSettingService.GetCustomerSettings(id);
            var assignedRoute = _routeService.GetAllRoutes()
                .SingleOrDefault(r => r.CustomerSettings.Any(cs => cs.CustomerId == customer.Id));
            var delayedBillingDropDownList = new DropDownListViewModel()
            {
                Items = _customerSettingService.GetCustomerSettingsOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.CustomerSettingOptionID.ToString(),
                            }),
                SelectedValue = customerSettings?.DelayedBillingID.ToString(),
            };
            var petFoodDropDownList = new DropDownListViewModel()
            {
                Items = _customerSettingService.GetCustomerSettingsOptions()
                        .Select(db => new SelectListItem()
                        {
                            Text = db.Name,
                            Value = db.CustomerSettingOptionID.ToString(),
                        }),
                SelectedValue = customerSettings?.PetFoodID.ToString(),
            };
            var routeDropDownList = new DropDownListViewModel()
            {
                Items = _routeService.GetAllRoutes()
                        .Select(r => new SelectListItem()
                        {
                            Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                            Value = r.RouteID.ToString(),
                        }),
                SelectedValue = assignedRoute?.RouteID.ToString(),
            };
            var model = new EditViewModel()
            {
                DelayedBillingDropDownList = delayedBillingDropDownList,
                PetFoodDropDownList = petFoodDropDownList,
                CustomerSettingID = customerSettings.CustomerSettingID,
                RouteDropDownList = routeDropDownList,
                ShippingCharge = customerSettings.HasShippingCharge,
                PetFoodMoney = customerSettings.PetFoodMoney,
                HasFinancialHold = customerSettings.HasFinancialHold,
                CustomerId = id,
                Customer = customer,
                CanEditFinancialHold = true, // User.IsInRole("Finance") || User.IsInRole("IT"),
                CanEditCustomerSettings = true // User.IsInRole("Client Service Representative") || User.IsInRole("Director of Client Services") || User.IsInRole("IT"),
            };

            return View(model);
        }

        //[Authorize(Roles = "Client Service Representative, Director of Client Services, IT")]
        [HttpPost]
        public ActionResult Edit(EditViewModel model)
        {
            _customerSettingService.UpdateCustomerRoute(model.CustomerSettingID, Int32.Parse(model.RouteDropDownList.SelectedValue));
            _customerSettingService.UpdateCustomerSettings(
                id: model.CustomerSettingID,
                petFoodID: Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                petFoodMoney: model.PetFoodMoney,
                shippingCharge: model.ShippingCharge,
                delayedBillingID: Int32.Parse(model.DelayedBillingDropDownList.SelectedValue),
                hasFinancialHold: model.HasFinancialHold);
            return RedirectToAction("Edit", new { id = model.CustomerId });
        }

        public ActionResult DetailsPartial(Customer customer)
        {
            return PartialView("_DetailsPartial", customer);
        }
    }
}