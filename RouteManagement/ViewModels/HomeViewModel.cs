using RouteManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wddc.Core.Entities.EdiOrdering.Routes;

namespace RouteManagement.ViewModels
{
    public class HomeViewModel
    {
        public Calendar Calendar { get; set; }
        public bool CanEditRoute { get; set; }
        public RouteDTO[] Routes { get; set; }
        public RouteDTO SelectedRoute { get; set; }
    }
}