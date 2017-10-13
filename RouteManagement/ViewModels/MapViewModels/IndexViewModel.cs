using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.ViewModels.MapViewModels
{
    public class IndexViewModel
    {
        public decimal lat { get; set; }
        public decimal lng { get; set; }
        public string Name { get; set; }
        public string Route { get; set; }
        public string CustomerId { get; set; }
    }
}