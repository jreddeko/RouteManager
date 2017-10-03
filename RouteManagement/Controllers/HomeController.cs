using RouteManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Wddc.Data;

namespace RouteManagement.Controllers
{
    [Authorize]
    public class HomeController : RouteManagementController
    {
        [HttpGet]
        public ActionResult Index(DateTime? date, int RouteID = 0)
        {
            var calendar = new Calendar(date ?? DateTime.Now);
            var routes = Service.GetAllRoutes();
            var viewModel = new ViewModels.HomeViewModel(
                routes.ToArray(),
                calendar
            );
            var f = viewModel.Routes.First().RouteSites.First().SiteOrderTypes.First().DeliveryDateDefaults.First();
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Index(Route obj)
        {
            if (obj == null)
                throw new ArgumentNullException("obj");
            Service.UpdateRoute(obj);
            var routes = Service.GetAllRoutes();
            return Json(new { routes = routes });
        }
    }
}
