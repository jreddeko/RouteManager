using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RouteManagement.DB.Framework.Repository
{
    public class RouteRepository : Repository<Route>
    {
        public RouteRepository(RoutingEntities dbContext) : base(dbContext)
        {
        }

        public override void Delete(Route entity)
        {
            base.Delete(entity);
        }

        public override IQueryable<Route> GetAll()
        {
            return _include(base.GetAll());
        }

        public override Route GetById(int id)
        {
            return _include(_getAll().Where(r => r.RouteID == id))
                .First();
        }

        public override IQueryable<Route> SearchFor(Expression<Func<Route, bool>> predicate)
        {
            return _include(base.SearchFor(predicate));
        }

        private IQueryable<Route> _include(IQueryable<Route> queryable)
        {
            return queryable
                .Include(i => i.RouteSites)
                .Include(i => i.RouteSites.Select(rs => rs.Site))
                .Include(i => i.RouteSites.Select(rs => rs.SiteOrderTypes.Select(sot => sot.OrderType)))
                .Include(i => i.RouteSites.Select(rs => rs.SiteOrderTypes.Select(sot => sot.Days)));
        }

        private IQueryable<Route> _getAll()
        {
            return _include(base.GetAll());
        }
    }
}
