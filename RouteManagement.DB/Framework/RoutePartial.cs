using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RouteManagement.DB.Framework
{
    public partial class Route : IRoute
    {
        IEnumerable<IRouteSite> IRoute.RouteSites
        {
            get
            {
                return this.RouteSites.Cast<IRouteSite>();
            }
        }
    }
}
