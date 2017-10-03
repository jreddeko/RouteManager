using RouteManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wddc.Data;

namespace RouteManagement.ViewModels
{
    public class HomeViewModel
    {
        public HomeViewModel(Route[] routes, Calendar calendar)
        {
            this.Routes = routes;
            this.Calendar = calendar;
        }

        public Calendar Calendar { get; private set; }
        public Route[] Routes { get; private set; }
    }
}