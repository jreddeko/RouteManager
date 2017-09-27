using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RouteManagement.ViewModels
{
    public class AddRouteExceptionViewModel
    {
        public SelectListItem[] AvailableRoutes { get; set; }
        public SelectListItem[] AvailableOrderTypes { get; set; }
        public DropDownListViewModel ClonedDate { get; set; }
        public DateTime ExceptionDate { get; set; }
        public AddRouteExceptionViewModel() { }
    }
}