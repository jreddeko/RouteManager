using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Wddc.DB.Framework.Repository
{
    internal class RouteRepository : IDisposable
    {
        private RoutingEntities _dbContext;

        public RouteRepository(RoutingEntities dbContext)
        {
            this._dbContext = dbContext;
        }

        public IEnumerable<Route> GetAll()
        {
            return _dbContext.Routes;
        }

        public Route GetByID(int id)
        {
            return _dbContext.Routes.Find(id);
        }

        public void Insert(Route route)
        {
            _dbContext.Routes.Add(route);
        }

        public void Delete(int routeID)
        {
            var student = _dbContext.Routes.Find(routeID);
            _dbContext.Routes.Remove(student);
        }

        public void Update(Route route)
        {
            _dbContext.Routes.AddOrUpdate(route);
            foreach (var site in route.RouteSites)
            {
                _dbContext.RouteSites.AddOrUpdate(site);
                foreach (var siteOrderType in site.SiteOrderTypes)
                {
                    _dbContext.SiteOrderTypes.AddOrUpdate(siteOrderType);
                    foreach (var day in siteOrderType.DeliveryDateDefaults)
                    {
                        _dbContext.DeliveryDateDefaults.AddOrUpdate(day);
                        foreach (var exception in day.DeliveryDateExceptions)
                        {
                            _dbContext.DeliveryDateExceptions.AddOrUpdate(exception);
                        }
                    }
                }
            }
        }

        public void Save()
        {
            _dbContext.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
