using System.Collections.Generic;

namespace RouteManagement.DB.Framework
{
    public interface ISiteOrderType
    {
        IEnumerable<IDay> Days { get; }
        IOrderType OrderType { get; }
        int OrderTypeID { get; }
        IRouteSite RouteSite { get; }
        int RouteSiteID { get; }
        int SiteOrderTypeID { get; }
    }
}