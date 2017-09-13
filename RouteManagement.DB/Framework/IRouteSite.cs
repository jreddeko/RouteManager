using System.Collections.Generic;

namespace RouteManagement.DB.Framework
{
    public interface IRouteSite
    {
        IRoute Route { get; }
        int RouteID { get; set; }
        int RouteSiteID { get; set; }
        Site Site { get; set; }
        int SiteID { get; set; }
        IEnumerable<ISiteOrderType> SiteOrderTypes { get;  }
    }
}