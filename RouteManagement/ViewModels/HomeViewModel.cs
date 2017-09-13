using RouteManagement.DB.Framework;
using RouteManagement.Models.RouteManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.ViewModels
{
    public class HomeViewModel
    {
        public HomeViewModel(IRoute[] routes)
        {
            this.Routes = routes;
        }

        public IRoute[] Routes { get; private set; }
    }
}