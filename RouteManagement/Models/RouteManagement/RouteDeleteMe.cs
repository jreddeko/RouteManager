using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.Models.RouteManagement
{
    public class RouteDeleteMe
    {
        public RouteDeleteMe(int i)
        {
            this.RouteID = i;
        }

        public RouteDeleteMe() { }

        public int RouteID { get; set; }
        public SiteDeleteMe[] Sites { get; set; }
    }
}