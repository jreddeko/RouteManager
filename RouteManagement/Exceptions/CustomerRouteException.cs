using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.Exceptions
{
    public class CustomerRouteException : Exception
    {
        public CustomerRouteException(string message) : base(message)
        {
        }
    }
}