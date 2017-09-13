using System.Collections.Generic;

namespace RouteManagement.DB.Framework
{
    public interface ISite
    {
        string Name { get; set; }
        int SiteID { get; set; }
    }
}