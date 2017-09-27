using Wddc.Resources.DB.Routing;
using RouteManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

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
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Index(Route obj)
        {
            Service.UpdateRoute(obj);
            var routes = Service.GetAllRoutes();
            return Json(new { routes = routes });
        }
    }
}
