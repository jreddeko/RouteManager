using RouteManagement.ViewModels.RouteViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RouteManagement.Controllers
{
    public class RouteController : RouteManagementController
    {

        [HttpGet]
        public ActionResult Add()
        {
            var model = new AddRouteViewModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult Add(AddRouteViewModel model)
        {
            if (ModelState.IsValid)
            {
                this.Service.AddRoute(model.RouteNumber, model.Description, Int32.Parse(model.RouteDropDownList.SelectedValue));
            }
            return View(model);
        }
    }
}