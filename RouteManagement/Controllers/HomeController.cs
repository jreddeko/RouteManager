using RouteManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Wddc.Core.Entities.EdiOrdering.Routes;
using Wddc.Services.EdiOrdering;

namespace RouteManagement.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private IRouteService _routeService;

        public HomeController(IRouteService routeService)
        {
            this._routeService = routeService;
        }

        /// <summary>
        /// Displays the main Route Management page
        /// </summary>
        /// <param name="date">date of week to display</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index(DateTime? date, int id = 0)
        {
            // get all routes
            var routes = _routeService
                .GetAllRoutes();

            RouteDTO selectedRoute = null;
            if (id != 0)
                selectedRoute = routes.SingleOrDefault(r => r.RouteID == id);
            // convert to viewmodel
            var viewModel = new ViewModels.HomeViewModel()
            {
                // get calendar week for date
                Calendar = new Calendar(date ?? DateTime.Now),
                Routes = routes.ToArray(),
                SelectedRoute = selectedRoute,
            };
            
            // return view
            return View(viewModel);
        }

        /// <summary>
        /// Updates route when changed
        /// </summary>
        /// <param name="route">Route updated</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index(RouteDTO route)
        {
            if (route == null)
                throw new ArgumentNullException("route");

            //update route
            _routeService.UpdateRoute(route);

            // get all routes
            var routes = _routeService.GetAllRoutes();

            // return json string of all updated routes
            return Json(new { routes = routes });
        }
    }
}
