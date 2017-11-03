using RouteManagement.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wddc.Services.EdiOrdering;

namespace RouteManagement.Controllers
{
    [Authorize]
    public class RouteExceptionController : Controller
    {
        private IRouteExceptionService _routeExceptionService;
        private IRouteService _routeService;

        public RouteExceptionController(IRouteExceptionService routeExceptionService,
            IRouteService routeService)
        {
            _routeExceptionService = routeExceptionService;
            _routeService = routeService;
        }

        /// <summary>
        /// Displays all excpections
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            // get all exceptions
            var exceptions = _routeExceptionService
                .GetAll();

            // add exception to viewmodel
            var model = new ViewModels.RouteExceptionViewModels.IndexViewModel()
            {
                ExceptionDates = exceptions.Select(e => e.Date).Distinct()
            };

            // returns view
            return View(model);
        }

        /// <summary>
        /// Add Exception page
        /// </summary>
        /// <returns></returns>
        //[Authorize(Roles = "Warehouse Manager, IT")]
        [HttpGet]
        public ActionResult Add()
        {
            // generates model
            var model = new AddRouteExceptionViewModel()
            {
                AvailableRoutes = this._getAvailableRoutes().ToArray(),
                AvailableOrderTypes = this._getAvailableOrderTypes().ToArray(),
                ClonedDate = new ViewModels.DropDownListViewModel()
                {
                    // turns days of week into a dropdownlist
                    Items = _routeService.GetDaysOfWeek()
                        .Select(r => new SelectListItem()
                        {
                            Text = r.Name,
                            Value = r.DayOfWeekID.ToString(),
                        }),
                },
                ExceptionDate = DateTime.Now,
            };

            // returns view
            return View(model);
        }
        //[Authorize(Roles = "Warehouse Manager, IT")]
        [HttpPost]
        public ActionResult Add(AddRouteExceptionViewModel model)
        {
            if (this.ModelState.IsValid)
            {
                var orderTypes = model.AvailableOrderTypes.Where(ot => ot.Selected)
                    .Select(ot => Int32.Parse(ot.Value))
                    .ToArray();
                var routes = model.AvailableRoutes.Where(ot => ot.Selected)
                    .Select(ot => Int32.Parse(ot.Value))
                    .ToArray();
                _routeService.AddException(model.ExceptionDate, Int32.Parse(model.ClonedDate.SelectedValue), orderTypes, routes);
                // do something
                return RedirectToAction("Index", "Home");
            }

            // model was incorrectly filled out, returns view with model and error(s)
            return View(model);
        }

        /// <summary>
        /// Deletes exception
        /// </summary>
        /// <param name="exceptionDate">Date of exception to delete</param>
        /// <returns></returns>
        //[Authorize(Roles = "Warehouse Manager, IT")]
        public ActionResult Delete(DateTime exceptionDate)
        {
            _routeExceptionService.Delete(exceptionDate);
            return RedirectToAction("Index");
        }

        private IEnumerable<SelectListItem> _getAvailableOrderTypes()
        {
            var orderTypes = _routeService.GetOrderTypes();
            return orderTypes
                .Select(r => new SelectListItem
                {
                    Text = r.Name,
                    Value = r.OrderTypeID.ToString(),
                    Selected = true
                });
        }

        private IEnumerable<SelectListItem> _getAvailableRoutes()
        {
            var routes = _routeService.GetAllRoutes();
            return routes
                .Select(r => new SelectListItem
                {
                    Text = r.Description + ": #" + r.RouteNumber,
                    Value = r.RouteID.ToString(),
                    Selected = true,
                });
        }
    }
}