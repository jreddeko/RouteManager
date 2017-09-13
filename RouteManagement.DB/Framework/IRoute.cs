using System.Collections.Generic;

namespace RouteManagement.DB.Framework
{
    public interface IRoute
    {
        int RouteID { get; set; }
        IEnumerable<IRouteSite> RouteSites { get; }
    }
}