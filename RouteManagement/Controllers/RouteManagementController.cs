using RouteManagement.ViewModels.RouteViewModels;
using System;
using System.Web.Mvc;
using Wddc.Services.Routes;

namespace RouteManagement.Controllers
{
    public class RouteManagementController : Controller
    {

        public RoutingService Service { get; private set; }

        public RouteManagementController()
        {
            this.Service = new RoutingService();
        }
    }
}