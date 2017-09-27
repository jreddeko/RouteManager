using Wddc.DB.Framework.Repository;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wddc.Resources.DB.Routing
{
    public class Service : IDisposable
    {
        private RoutingEntities _dbContext = new RoutingEntities();

        public Service()
        {        
        }

        public IEnumerable<Route> GetAllRoutes()
        {
            var repo = new RouteRepository(_dbContext);
            return repo.GetAll().ToList();
        }

        public IEnumerable<DayOfWeek> GetDefaultDates()
        {
                var repo = new Repository<DayOfWeek>(_dbContext);
                return repo.GetAll().ToList();
        }

        public void UpdateRoute(Route route)
        {
            var repo = new RouteRepository(_dbContext);
            repo.Update(route);
            repo.Save();             
        }

        public ClinicSetting[] GetAllMembers()
        {
            var repo = new Repository<ClinicSetting>(_dbContext);
            return repo.GetAll().ToArray();
        }

        public void UpdateMemberRoute(int id, int routeID)
        {
            var repo = new Repository<ClinicSetting>(_dbContext);
            var item = repo.GetById(id);
            item.RouteID = routeID;
            _dbContext.SaveChanges();
        }

        public IEnumerable<ClinicSettingsDelayedBilling> GetDelayedBillingOptions()
        {
            var repo = new Repository<ClinicSettingsDelayedBilling>(_dbContext);
            return repo.GetAll();
        }

        public IEnumerable<ClinicSettingsPetFood> GetPetFoodOptions()
        {
            var repo = new Repository<ClinicSettingsPetFood>(_dbContext);
            return repo.GetAll();
        }

        public void UpdateMemberSettings(int id, int petFoodID, decimal? petFoodMoney, bool shippingCharge, int delayedBillingID)
        {
            var repo = new Repository<ClinicSetting>(_dbContext);
            var item = repo.GetById(id);
            item.PetFoodID = petFoodID;
            item.PetFoodMoney = petFoodMoney;
            item.ShippingCharge = shippingCharge;
            item.DelayedBillingID = delayedBillingID;
            _dbContext.SaveChanges();
        }

        public ClinicSetting GetClinicSettings(int id)
        {
            var repo = new Repository<ClinicSetting>(_dbContext);
            return repo.GetById(id);
        }

        public IEnumerable<OrderType> GetOrderTypes()
        {
            var repo = new Repository<OrderType>(_dbContext);
            return repo.GetAll().ToList();
        }

        public void AddException(DateTime exceptionDate, int clonedDayOfWeek, int[] orderTypeIDs, int[] routeIDs)
        {
            using (var dbContext = new RoutingEntities())
            {
                var defaultDates = dbContext.DeliveryDateDefaults
                    .Include(i => i.SiteOrderType.RouteSite).ToArray();
                var defaultDatesAffected = defaultDates
                    .Where(dd => orderTypeIDs.Contains(dd.SiteOrderType.OrderTypeID))
                    .Where(dd => routeIDs.Contains(dd.SiteOrderType.RouteSite.RouteID))
                    .ToArray();

                var deliveryDateExceptionRepo = new Repository<DeliveryDateException>(dbContext);
                foreach (var defaultDate in defaultDatesAffected)
                {
                    var clondedDeliveryDate = defaultDates
                        .Single(dd => dd.SiteOrderType == defaultDate.SiteOrderType
                        && clonedDayOfWeek == dd.DayOfWeek);

                    if (defaultDate.DeliveryDateExceptions.Any(x=> x.Date == exceptionDate))
                    {
                        foreach (var e in defaultDate.DeliveryDateExceptions.Where(x => x.Date == exceptionDate).ToList())
                        {
                            deliveryDateExceptionRepo.Delete(e);
                        }
                    }

                    var exception = new DeliveryDateException()
                    {
                        Date = exceptionDate,
                        DeliveryCutOff = clondedDeliveryDate.DeliveryCutOff,
                        DeliveryDateDefault = defaultDate,
                        HasDelivery = clondedDeliveryDate.HasDelivery,
                        IncrementDeliveryByDays = clondedDeliveryDate.IncrementDeliveryByDays,
                        DeliveryDateDefaultID = defaultDate.DeliveryDateDefaultID,
                    };
                    deliveryDateExceptionRepo.Insert(exception);
                }
                dbContext.SaveChanges();
            }
        }

        public int _getDayOfWorkWeek(DateTime date)
        {
            switch (date.DayOfWeek)
            {
                case System.DayOfWeek.Sunday:
                    return 1;
                case System.DayOfWeek.Monday:
                    return 2;
                case System.DayOfWeek.Tuesday:
                    return 3;
                case System.DayOfWeek.Wednesday:
                    return 4;
                case System.DayOfWeek.Thursday:
                    return 5;
                case System.DayOfWeek.Friday:
                    return 6;
                case System.DayOfWeek.Saturday:
                    return 7;
            }
            throw new Exception("DayOfWorkWeek not defined for date: " + date.ToString());
        }

        public void Dispose()
        {
            this._dbContext.Dispose();
        }
    }
}
