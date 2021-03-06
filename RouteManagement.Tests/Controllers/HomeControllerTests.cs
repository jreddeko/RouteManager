﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RouteManagement.Controllers;
using System.Web.Mvc;
using RouteManagement.ViewModels;
using System.Linq;
using Wddc.Data;
using System.Collections.Generic;
using Wddc.Services.EdiOrdering;
using Wddc.Data.EdiOrdering;

namespace RouteManagement.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTests : RouteManagementTest
    {
        private HomeController controller;
        [TestInitialize]
        public void Setup()
        {
            base.Init();
            controller = new HomeController(_routeService);
        }

        [TestCleanup]
        public void TestCleanup()
        {
            var customerSettings = _customerSettingService
                .GetAllCustomers()
                .Where(m => m.CustomerId.Contains("unit test"));
            foreach (var customerSetting in customerSettings.ToList())
                _customerSettingService
                    .DeleteCustomerSetting(customerSetting);
            var routes = _routeService
                .GetAllRoutes()
                .Where(r => r.Description.Contains("unit test"));
            foreach (var route in routes.ToList())
                _routeService.DeleteRoute(route);
        }

        [TestMethod]
        public void Index_Post_1()
        {
            var routeToInsert = getTestRoute(999999, "unit test");
            controller.Index(routeToInsert);
            var addedRoutes = _routeService
                .GetAllRoutes()
                .Where(r => r.RouteNumber == 999999);
            Assert.IsTrue(addedRoutes.Count() == 1);
            var route = addedRoutes.First();
            Assert.IsTrue(route.Description == routeToInsert.Description);
            Assert.IsTrue(route.RouteNumber == routeToInsert.RouteNumber);
            Assert.IsTrue(route.RouteSites.Count() == routeToInsert.RouteSites.Count());
            Assert.IsTrue(route.RouteSites.SequenceEqual(routeToInsert.RouteSites, new RouteSiteComparer()));

            Assert.IsTrue(route.CustomerSettings.Count() == routeToInsert.CustomerSettings.Count());
            Assert.IsTrue(route.CustomerSettings.SequenceEqual(routeToInsert.CustomerSettings, new CustomerSettingsComparer()));

        }

        [TestMethod]
        public void Index_Post_2()
        {
            var routeToInsert = getTestRoute(999999, "unit test");
            routeToInsert.CustomerSettings.First().PetFoodMoney = -150;
            controller.Index(routeToInsert);

        }

        [TestMethod]
        public void Index_Get_1()
        {
            var datetime = DateTime.Parse("2017-01-05");
            var result = controller.Index(datetime) as ViewResult;
            Assert.IsNotNull(result, "Result null check");
            var model = result.Model as HomeViewModel;
            Assert.IsNotNull(model, "Cast to model null check");
            Assert.IsTrue(model.Calendar.FirstDayOfWeek == DateTime.Parse("2017-01-01"), "Calendar.FirstDayOfWeek check");
            Assert.IsTrue(model.Calendar.Week.Count() == 7, "Day of week count check.");
            Assert.IsTrue(model.Routes.Count() > 0, "Route count check");
            foreach (var route in model.Routes)
            {
                Assert.IsTrue(!String.IsNullOrEmpty(route.Description));
                Assert.IsTrue(route.RouteID > 0);
                Assert.IsTrue(route.RouteNumber > 0);
                Assert.IsTrue(route.RouteSites.Count() > 0);
                foreach (var routeSite in route.RouteSites)
                {
                    Assert.IsTrue(routeSite.Site != null);
                    Assert.IsTrue(!String.IsNullOrEmpty(routeSite.Site.Name));
                    Assert.IsTrue(routeSite.SiteID > 0);
                    Assert.IsTrue(routeSite.SiteOrderTypes.Count() > 0);
                    foreach (var sot in routeSite.SiteOrderTypes)
                    {
                        Assert.IsTrue(sot.OrderTypeID > 0);
                        Assert.IsTrue(sot.DeliveryDateDefaults.Count() == 7);
                        Assert.IsTrue(sot.DeliveryDateDefaults.All(ddd => ddd.DayOfWeekID > 0));
                        Assert.IsTrue(sot.DeliveryDateDefaults.All(ddd => !String.IsNullOrEmpty(ddd.DayOfWeek.Name)));
                        Assert.IsTrue(sot.OrderTypeID > 0);
                        Assert.IsTrue(!String.IsNullOrEmpty(sot.OrderType.Name));
                        foreach (var ddd in sot.DeliveryDateDefaults)
                        {
                            foreach (var dde in ddd.DeliveryDateExceptions)
                            {
                                Assert.IsFalse(String.IsNullOrEmpty(dde.DateString));
                            }
                        }
                    }
                }
            }
        }

    }
}
