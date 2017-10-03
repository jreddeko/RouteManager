using RouteManagement.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wddc.Services.Routes;

namespace RouteManagement.Controllers
{
    public class RouteExceptionController : RouteManagementController
    {
        private RouteExceptionService routeExceptionService = new RouteExceptionService();
        // GET: RouteException
        public ActionResult Index()
        {
            var exceptions = routeExceptionService.GetAll();
            var model = new ViewModels.RouteExceptionViewModels.IndexViewModel()
            {
                ExceptionDates = exceptions.Select(e => e.Date).Distinct()
            };
            return View(model);
        }

        [HttpGet]
        public ActionResult Add()
        {
            var model = new AddRouteExceptionViewModel()
            {
                AvailableRoutes = this._getAvailableRoutes().ToArray(),
                AvailableOrderTypes = this._getAvailableOrderTypes().ToArray(),
                ClonedDate = new ViewModels.DropDownListViewModel()
                {
                    Items = this.Service.GetDefaultDates()
                        .Select(r => new SelectListItem()
                        {
                            Text = r.Name,
                            Value = r.DayOfWeekID.ToString(),
                        }),
                },
                ExceptionDate = DateTime.Now,
            };
            return View(model);
        }

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
                Service.AddException(model.ExceptionDate, Int32.Parse(model.ClonedDate.SelectedValue), orderTypes, routes);
                // do something
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        public ActionResult Delete(DateTime exceptionDate)
        {
            routeExceptionService.Delete(exceptionDate);
            return RedirectToAction("Index");
        }

        private IEnumerable<SelectListItem> _getAvailableOrderTypes()
        {
            var orderTypes = this.Service.GetOrderTypes();
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
            var routes = this.Service.GetAllRoutes();
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