using RouteManagement.DB.Framework;
using RouteManagement.DB.Framework.Repository;
using RouteManagement.Models.RouteManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace RouteManagement.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            using (var repo = new RouteRepository(new RoutingEntities()))
            {
                var model = repo.GetAll();
                var vm = new ViewModels.HomeViewModel(model.ToArray());
                return View(vm);
            }
        }

        [HttpPost]
        public ActionResult Index(RouteDeleteMe obj)
        {
            return View();
        }

        //private Route[] _getTestData()
        //{
        //    var rand = new Random(Guid.NewGuid().GetHashCode());
        //    var site1 = new Site() { Name = "Edmonton", };
        //    var site2 = new Site() { Name = "Manitoba", };

        //    var orderTypes = new OrderType[]
        //    {
        //        new OrderType { Name =  "Regular"},
        //        new OrderType { Name =  "Pet Food"},
        //        new OrderType { Name =  "Fridge"}
        //    };

        //    var routes = new List<Route>();
        //    for (int i = 0; i < 250; i++)
        //    {
        //        var route = new Route() { RouteID = i, };
        //        route.RouteSites = new RouteSite[]
        //        {
        //            new RouteSite() { Site = site1 },
        //            new RouteSite() { Site = site2 },
        //        };

        //        foreach (var site in route.RouteSites)
        //        {
        //            site.SiteOrderTypes = new SiteOrderType[]
        //                {
        //                    new SiteOrderType() { OrderType = orderTypes[0] },
        //                    new SiteOrderType() { OrderType = orderTypes[1] },
        //                    new SiteOrderType() { OrderType = orderTypes[2] },
        //                };

        //            foreach (var orderType in site.SiteOrderTypes)
        //            {
        //                orderType.Days = new Day[]
        //                {
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 11),
        //                        CutOff = (new DateTime(2017, 9, 11)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 12),
        //                        CutOff = (new DateTime(2017, 9, 12)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 13),
        //                        CutOff = (new DateTime(2017, 9, 13)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 14),
        //                        CutOff = (new DateTime(2017, 9, 14)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 15),
        //                        CutOff = (new DateTime(2017, 9, 15)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 16),
        //                        CutOff = (new DateTime(2017, 9, 16)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                    new Day
        //                    {
        //                        Date = new DateTime(2017, 9, 17),
        //                        CutOff = (new DateTime(2017, 9, 17)).AddHours(rand.Next(12)).TimeOfDay,
        //                        HasDelivery = rand.Next(2) == 1 ? true : false,
        //                        IncrementByDays = rand.Next(5),
        //                    },
        //                };
        //            }
        //        }
        //        routes.Add(route);
        //    }
        //    return routes.ToArray();
        //}
    }
}
