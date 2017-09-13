using System.Collections.Generic;

namespace RouteManagement.DB.Framework
{
    public interface IOrderType
    {
        string Name { get; set; }
        int OrderTypeID { get; set; }
    }
}