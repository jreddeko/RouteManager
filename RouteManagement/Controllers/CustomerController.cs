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
        public ActionResult Index(string search, int? page, DropDownListViewModel SetupStatesDropDownList)
        {
            SetupState state;
            if (SetupStatesDropDownList?.SelectedValue == null)
                state = SetupState.Any;
            else
                state = (SetupState)Enum.Parse(typeof(SetupState), SetupStatesDropDownList.SelectedValue);


            var customers = _customerSetupStateService.GetAll(state, page ?? 1, 25, search);
            var model = new IndexViewModel()
            {
                Customers = customers,
                Page = page ?? 1,
                SetupStatesDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = Enum.GetNames(typeof(SetupState))
                        .Select(e => new SelectListItem()
                        {
                            Text = e,
                            Value = e,
                        }),
                    SelectedValue = state.ToString(),
                    OnChangeSubmit = true,
                },
                Search = search,
            };
            return View(model);
        }

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
            var delayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = _customerSettingService.GetCustomerSettingsOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.CustomerSettingOptionID.ToString(),
                            }),
                    SelectedValue = customerSettings?.DelayedBillingID.ToString(),
                };
            var petFoodDropDownList = new ViewModels.DropDownListViewModel()
            {
                Items = _customerSettingService.GetCustomerSettingsOptions()
                        .Select(db => new SelectListItem()
                        {
                            Text = db.Name,
                            Value = db.CustomerSettingOptionID.ToString(),
                        }),
                SelectedValue = customerSettings?.PetFoodID.ToString(),
            };
            var routeDropDownList = new ViewModels.DropDownListViewModel()
            {
                Items = _routeService.GetAllRoutes()
                        .Select(r => new SelectListItem()
                        {
                            Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                            Value = r.RouteID.ToString(),
                        }),
                SelectedValue = assignedRoute?.RouteID.ToString(),
            };
            var model = new ViewModels.CustomerViewModels.EditViewModel()
            {
                DelayedBillingDropDownList = delayedBillingDropDownList,
                PetFoodDropDownList = petFoodDropDownList,
                CustomerSettingID = customerSettings.CustomerSettingID,
                RouteDropDownList = routeDropDownList,
                ShippingCharge = customerSettings.HasShippingCharge,
                PetFoodMoney = customerSettings.PetFoodMoney,
                CustomerId = id,
                Customer = customer,
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(ViewModels.CustomerViewModels.EditViewModel model)
        {
            _customerSettingService.UpdateCustomerRoute(model.CustomerSettingID, Int32.Parse(model.RouteDropDownList.SelectedValue));
            _customerSettingService.UpdateCustomerSettings(model.CustomerSettingID,
                Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                model.PetFoodMoney,
                model.ShippingCharge,
                Int32.Parse(model.DelayedBillingDropDownList.SelectedValue));
            return RedirectToAction("Edit", new { id = model.CustomerId });
        }

        public ActionResult DetailsPartial(Customer customer)
        {
            return PartialView("_DetailsPartial", customer);
        }
    }
}