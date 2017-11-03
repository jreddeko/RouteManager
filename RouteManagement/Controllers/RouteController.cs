using RouteManagement.ViewModels.RouteViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wddc.Services.EdiOrdering;

namespace RouteManagement.Controllers
{
    //[Authorize(Roles = "Warehouse Manager, IT")]
    public class RouteController : Controller
    {
        private IRouteService _routeService;

        public RouteController(IRouteService routeService)
        {
            _routeService = routeService;
        }

        /// <summary>
        /// Returns view to add a new route
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Add()
        {
            var routes = _routeService.GetAllRoutes();
            var model = new AddRouteViewModel(routes);
            return View(model);
        }

        /// <summary>
        /// Updates route
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Add(AddRouteViewModel model)
        {
            if (ModelState.IsValid)
            {
                // get route that is to be cloned
                var route = _routeService.GetAllRoutes()
                    .Single(r => r.RouteID == Int32.Parse(model.RouteDropDownList.SelectedValue));

                // clones route
                var clonedRoute = _routeService.CloneRoute(route, model.RouteNumber, model.Description);

                // adds route
                _routeService.AddRoute(clonedRoute);

                // redirects to Route Management main page
                return RedirectToAction("Index", "Home");
            }

            var routes = _routeService.GetAllRoutes();
            model = new AddRouteViewModel(routes);
            // model was incorrectly filled out, returns view with model and error(s)
            return View(model);
        }
    }
}