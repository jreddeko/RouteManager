using RouteManagement.ViewModels.MemberViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using PagedList;
using RouteManagement.ViewModels;
using Wddc.Data;
using RouteManagement.Exceptions;
using Wddc.Core.Entities.Members;

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
            using (var apiClient = new ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
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
                return RedirectToAction("Edit", new { id = result.MemberNumber });
            }
            return View(model);
        }

        [HttpGet]
        public async Task<ActionResult> Add(string id)
        {
            using (var apiClient = new ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
            {
                var member = await apiClient.GetMemberAsync(id);
                if (member == null)
                    throw new ArgumentException(String.Format("Member: '{0}' not found.", id));
                if (member.SetupState == SetupState.Complete)
                    throw new MemberRouteException(String.Format("Member: '{0}' has already been added to a route.", id));
                if (member.SetupState == SetupState.PendingShippingSetup)
                    throw new MemberRouteException(String.Format("Member: '{0}' required shipping setup.", id));

                var model = new ViewModels.MemberViewModels.AddViewModel()
                {
                    DelayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetMemberSettingsOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.MemberSettingOptionID.ToString(),
                            }),
                        SelectedValue = "1",
                    },

                    PetFoodDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetMemberSettingsOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.MemberSettingOptionID.ToString(),
                            }),
                        SelectedValue = "1",
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
                    MemberNumber = member.Id,
                    MemberName = member.Information.Name,
                    PetFoodMoney = 475.00m,
                    ShippingCharge = false,
                };
                return View(model);
            }
        }

        [HttpGet]
        public async Task<ActionResult> Edit(string id)
        {
            using (var apiClient = new ApiMemberClient(System.Configuration.ConfigurationManager.AppSettings["WebAPIBaseUrl"]))
            {
                var member = await apiClient.GetMemberAsync(id);
                if (member == null)
                    return HttpNotFound();
                var memberSettings = this.Service.GetMemberSettings(id);
                var assignedRoute = this.Service.GetAllRoutes()
                    .SingleOrDefault(r => r.MemberSettings.Any(cs => cs.MemberNumber == member.Id));
                var delayedBillingDropDownList = new ViewModels.DropDownListViewModel()
                    {
                        Items = this.Service.GetMemberSettingsOptions()
                                .Select(db => new SelectListItem()
                                {
                                    Text = db.Name,
                                    Value = db.MemberSettingOptionID.ToString(),
                                }),
                        SelectedValue = memberSettings?.DelayedBillingID.ToString(),
                    };
                var petFoodDropDownList = new ViewModels.DropDownListViewModel()
                {
                    Items = this.Service.GetMemberSettingsOptions()
                            .Select(db => new SelectListItem()
                            {
                                Text = db.Name,
                                Value = db.MemberSettingOptionID.ToString(),
                            }),
                    SelectedValue = memberSettings?.PetFoodID.ToString(),
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
                    MemberSettingID = memberSettings.MemberSettingID,
                    RouteDropDownList = routeDropDownList,
                    ShippingCharge = memberSettings.HasShippingCharge,
                    PetFoodMoney = memberSettings.PetFoodMoney,
                    MemberNumber = id,
                    Member = member,
                };

                return View(model);
            }

        }

        [HttpPost]
        public ActionResult Edit(ViewModels.MemberViewModels.EditViewModel model)
        {
            this.Service.UpdateMemberRoute(model.MemberSettingID, Int32.Parse(model.RouteDropDownList.SelectedValue));
            this.Service.UpdateMemberSettings(model.MemberSettingID,
                Int32.Parse(model.PetFoodDropDownList.SelectedValue),
                model.PetFoodMoney,
                model.ShippingCharge,
                Int32.Parse(model.DelayedBillingDropDownList.SelectedValue));
            return RedirectToAction("Edit", new { id = model.MemberNumber });
        }

        public ActionResult DetailsPartial(Member member)
        {
            return PartialView("_DetailsPartial", member);
        }
    }
}