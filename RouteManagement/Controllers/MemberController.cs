using RouteManagement.ViewModels.MemberViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Wddc.Resources.DB;
using Wddc.Resources.DB.AscTrac;
using Wddc.Resources.DB.GreatPlains;
using Wddc.Resources.Entities;
using PagedList;
using Wddc.Resources.DB.Routing;
using RouteManagement.ViewModels;

namespace RouteManagement.Controllers
{
    public class MemberController : RouteManagementController
    {

        [HttpGet]
        public async Task<ActionResult> Index(string search, string startsAt, DropDownListViewModel SetupStatesDropDownList)
        {
            SetupState state;
            if (SetupStatesDropDownList?.SelectedValue == null)
                state = SetupState.Any;
            else
                state = (SetupState)Enum.Parse(typeof(SetupState), SetupStatesDropDownList.SelectedValue);
            using (var apiClient = new Wddc.Resources.ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
            {
                var listing = await apiClient.GetMembersAsync(25, search, startsAt, state);
                var model = new IndexViewModel()
                {
                    Members = listing.results.ToArray(),
                    NextID = listing.next_id,
                    PrevID = listing.prev_id,
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
        }

        [HttpPost]
        public ActionResult Add(AddViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = this.Service.AddNewMemberSettings(model.MemberNumber,
                    Int32.Parse(model.RouteDropDownList.SelectedValue),
                    Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                    model.PetFoodMoney,
                    model.ShippingCharge,
                    Int32.Parse(model.DelayedBillingDropDownList.SelectedValue)
                );
                return RedirectToAction("Edit", new { id = result.CustomerNumber });
            }
            return View(model);
        }

        [HttpGet]
        public async Task<ActionResult> Add(string id)
        {
            using (var apiClient = new Wddc.Resources.ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
            {
                var member = await apiClient.GetMemberAsync(id);
                var model = new ViewModels.MemberViewModels.AddViewModel()
                {
                    DelayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetDelayedBillingOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.DelayedBillingID.ToString(),
                            }),
                        SelectedValue = null,
                    },

                    PetFoodDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetPetFoodOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.PetFoodID.ToString(),
                            }),
                        SelectedValue = null,
                    },
                    RouteDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetAllRoutes()
                            .Select(r => new SelectListItem()
                            {
                                Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                                Value = r.RouteID.ToString(),
                            }),
                        SelectedValue = null,
                    },
                    MemberNumber = member.id,
                    MemberName = member.Information.Name,
                    PetFoodMoney = 0,
                    ShippingCharge = false,
                };
                return View(model);
            }
        }

        [HttpGet]
        public async Task<ActionResult> Edit(string id)
        {
            using (var apiClient = new Wddc.Resources.ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
            {
                var member = await apiClient.GetMemberAsync(id);
                var clinicSettings = this.Service.GetClinicSettings(id);
                var petFoodOptions = this.Service.GetPetFoodOptions();
                var assignedRoute = this.Service.GetAllRoutes()
                    .SingleOrDefault(r => r.ClinicSettings.Any(cs => cs.CustomerNumber == member.id));
                var delayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetDelayedBillingOptions()
                                .Select(db => new SelectListItem()
                                {
                                    Text = db.Name,
                                    Value = db.DelayedBillingID.ToString(),
                                }),
                        SelectedValue = clinicSettings?.DelayedBillingID.ToString(),
                    };
                var petFoodDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = this.Service.GetPetFoodOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.PetFoodID.ToString(),
                            }),
                    SelectedValue = clinicSettings?.PetFoodID.ToString(),
                };
                var routeDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = this.Service.GetAllRoutes()
                            .Select(r => new SelectListItem()
                            {
                                Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                                Value = r.RouteID.ToString(),
                            }),
                    SelectedValue = assignedRoute?.RouteID.ToString(),
                };
                var model = new ViewModels.MemberViewModels.EditViewModel()
                {
                    DelayedBillingDropDownList = delayedBillingDropDownList,
                    PetFoodDropDownList = petFoodDropDownList,
                    ID = clinicSettings.ClinicSettingsID,
                    RouteDropDownList = routeDropDownList,
                    ShippingCharge = clinicSettings.ShippingCharge,
                    PetFoodMoney = clinicSettings.PetFoodMoney,
                    CustomerNumber = id,
                    Member = member,
                };

                return View(model);
            }

        }

        [HttpPost]
        public ActionResult Edit(ViewModels.MemberViewModels.EditViewModel model)
        {
            this.Service.UpdateMemberRoute(model.ID, Int32.Parse(model.RouteDropDownList.SelectedValue));
            this.Service.UpdateMemberSettings(model.ID,
                Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                model.PetFoodMoney,
                model.ShippingCharge,
                Int32.Parse(model.DelayedBillingDropDownList.SelectedValue));
            return RedirectToAction("Edit", new { id = model.ID });
        }

        public ActionResult DetailsPartial(Member member)
        {
            return PartialView("_DetailsPartial", member);
        }
    }
}