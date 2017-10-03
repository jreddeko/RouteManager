using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wddc.Data;

namespace RouteManagement.Tests
{
    public class RouteManagementTest
    {
        internal Route getTestRoute(int routeNumber, string routeDescription)
        {
            var memberSetting = getTestMemberSetting(routeDescription);
            var routeSite = new RouteSite()
            {
                SiteID = 1,
                SiteOrderTypes = new List<SiteOrderType>()
                {
                    getSiteOrderType(1),
                    getSiteOrderType(2),
                    getSiteOrderType(3),
                },
            };
            var route = new Route()
            {
                Description = routeDescription,
                RouteNumber = routeNumber,
                MemberSettings = new List<MemberSetting>() { memberSetting, },
                RouteSites = new List<RouteSite>() { routeSite },
            };
            return route;
        }

        internal static SiteOrderType getSiteOrderType(int orderTypeID)
        {
            return new SiteOrderType()
            {
                OrderTypeID = orderTypeID,
                DeliveryDateDefaults = new List<DeliveryDateDefault>() {
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

        internal static DeliveryDateDefault getDeliveryDateDefault(int dayOfWeekID, TimeSpan cutoff,
            bool hasDelivery = true, int incremenberByDays = 0)
        {
            return new DeliveryDateDefault()
            {
                DayOfWeekID = dayOfWeekID,
                DeliveryCutOff = cutoff,
                HasDelivery = hasDelivery,
                IncrementDeliveryByDays = incremenberByDays,
            };
        }

        internal static MemberSetting getTestMemberSetting(string memberNumber, int delayedBillingID = 1,
            bool hasFinancialHold = false, bool hasShippingCharge = false, int petFoodID = 1, decimal petFoodMoney = 500.00m)
        {
            return new MemberSetting()
            {
                DelayedBillingID = delayedBillingID,
                HasFinancialHold = hasFinancialHold,
                HasShippingCharge = hasShippingCharge,
                MemberNumber = memberNumber,
                PetFoodID = petFoodID,
                PetFoodMoney = petFoodMoney,
            };
        }
    }
}
