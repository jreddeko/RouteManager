using Microsoft.VisualStudio.TestTools.UnitTesting;
using Rhino.Mocks;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wddc.Core.Entities.EdiOrdering.Routes;
using Wddc.Core.Infrastructure;
using Wddc.Data;
using Wddc.Data.AscTrac;
using Wddc.Data.EdiOrdering;
using Wddc.Data.GreatPlains;
using Wddc.Services.AscTrac;
using Wddc.Services.EdiOrdering;
using Wddc.Services.GreatPlains;

namespace RouteManagement.Tests
{
    public class RouteManagementTest
    {
        protected IRouteService _routeService;
        protected CustomerSettingService _customerSettingService;
        private CustomerSetupStateService _customerSetupStateService;

        public void Init()
        {
            // sets up engine context from Wddc.Core
            EngineContext.Initialize(false);

            var customerSettingRepository = MockRepository.GenerateMock<IEdiRepository<CustomerSetting>>();
            var dayOfWeekRepository = MockRepository.GenerateMock<IEdiRepository<Wddc.Data.EdiOrdering.DayOfWeek>>();
            var customerSettingOptionRepository = MockRepository.GenerateMock<IEdiRepository<CustomerSettingOption>>();
            var orderTypeRepository = MockRepository.GenerateMock<IEdiRepository<OrderType>>();
            var routeRepository = MockRepository.GenerateMock<IEdiRepository<Route>>();
            var defaultDateRepository = MockRepository.GenerateMock<IEdiRepository<DeliveryDateDefault>>();
            var siteOrderTypeRepository = MockRepository.GenerateMock<IEdiRepository<SiteOrderType>>();
            var exceptionDateRepository = MockRepository.GenerateMock<IEdiRepository<DeliveryDateException>>();
            var customerRepostiory = MockRepository.GenerateMock<IGpRepository<RM00101>>();
            var customerService = new CustomerService(customerRepostiory);
            _routeService = new RouteService(dayOfWeekRepository,
                orderTypeRepository, routeRepository, defaultDateRepository,
                siteOrderTypeRepository, exceptionDateRepository, customerService);
            var gpCustomerRepository = MockRepository.GenerateMock<IGpRepository<RM00101>>();
            gpCustomerRepository
                .Expect(x => x.Table)
                .Return((new GpObjectContext()).RM00101);
            var carrierAccountRepository = MockRepository.GenerateMock<IAscRepository<CARRIERACCT>>();
            carrierAccountRepository
                .Expect(x => x.Table)
                .Return((new AscObjectContext()).CARRIERACCTs);
            var carrierAccountService = new CarrierAccountService(carrierAccountRepository);
            var customerSettingService = new CustomerSettingService(customerSettingRepository,
                customerSettingOptionRepository);

            _customerSetupStateService = new CustomerSetupStateService(
                carrierAccountService, customerService, customerSettingService);
        }
        internal RouteDTO getTestRoute(int routeNumber, string routeDescription)
        {
            var customerSetting = getTestCustomerSetting(routeDescription);
            var routeSite = new RouteSiteDTO()
            {
                SiteID = 1,
                SiteOrderTypes = new List<SiteOrderTypeDTO>()
                {
                    getSiteOrderType(1),
                    getSiteOrderType(2),
                    getSiteOrderType(3),
                },
            };
            var route = new RouteDTO()
            {
                Description = routeDescription,
                RouteNumber = routeNumber,
                CustomerSettings = new List<CustomerSettingDTO>() { customerSetting, },
                RouteSites = new List<RouteSiteDTO>() { routeSite },
            };
            return route;
        }

        internal static SiteOrderTypeDTO getSiteOrderType(int orderTypeID)
        {
            return new SiteOrderTypeDTO()
            {
                OrderTypeID = orderTypeID,
                DeliveryDateDefaults = new List<DeliveryDateDefaultDTO>() {
                    getDeliveryDateDefault(1, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(2, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(3, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(4, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(5, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(6, new TimeSpan(5, 5, 5)),
                    getDeliveryDateDefault(7, new TimeSpan(5, 5, 5)),
                },
            };
        }

        internal static DeliveryDateDefaultDTO getDeliveryDateDefault(int dayOfWeekID, TimeSpan cutoff,
            bool hasDelivery = true, int incremenberByDays = 0)
        {
            return new DeliveryDateDefaultDTO()
            {
                DayOfWeekID = dayOfWeekID,
                DeliveryCutOff = cutoff,
                HasDelivery = hasDelivery,
                IncrementDeliveryByDays = incremenberByDays,
            };
        }

        internal static CustomerSettingDTO getTestCustomerSetting(string customerId, int delayedBillingID = 1,
            bool hasFinancialHold = false, bool hasShippingCharge = false, int petFoodID = 1, decimal petFoodMoney = 500.00m)
        {
            return new CustomerSettingDTO()
            {
                DelayedBillingID = delayedBillingID,
                HasFinancialHold = hasFinancialHold,
                HasShippingCharge = hasShippingCharge,
                CustomerId = customerId,
                PetFoodID = petFoodID,
                PetFoodMoney = petFoodMoney,
            };
        }
    }
}
