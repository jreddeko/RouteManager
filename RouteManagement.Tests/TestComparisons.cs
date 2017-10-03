using System;
using System.Collections.Generic;
using System.Linq;
using Wddc.Data;

namespace RouteManagement.Tests
{
    internal class RouteSiteComparer : IEqualityComparer<RouteSite>
    {
        public bool Equals(RouteSite x, RouteSite y)
        {
            return x.SiteID == y.SiteID && 
                x.SiteOrderTypes.SequenceEqual(y.SiteOrderTypes, new SiteOrderTypesComparer());
        }

        public int GetHashCode(RouteSite obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class MemberSettingsComparer : IEqualityComparer<MemberSetting>
    {
        public bool Equals(MemberSetting x, MemberSetting y)
        {
            return x.DelayedBillingID == y.DelayedBillingID &&
                x.HasFinancialHold == y.HasFinancialHold &&
                x.HasShippingCharge == y.HasShippingCharge &&
                x.MemberNumber == y.MemberNumber &&
                x.PetFoodID == y.PetFoodID &&
                x.PetFoodMoney == y.PetFoodMoney;
        }

        public int GetHashCode(MemberSetting obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class SiteOrderTypesComparer : IEqualityComparer<SiteOrderType>
    {
        public bool Equals(SiteOrderType x, SiteOrderType y)
        {
            return x.OrderTypeID == y.OrderTypeID && 
                x.DeliveryDateDefaults.SequenceEqual(y.DeliveryDateDefaults, new DeliveryDateDefaultsComparer());
        }

        public int GetHashCode(SiteOrderType obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class DeliveryDateDefaultsComparer : IEqualityComparer<DeliveryDateDefault>
    {
        public bool Equals(DeliveryDateDefault x, DeliveryDateDefault y)
        {
            return x.CutOffString == y.CutOffString &&
                x.DayOfWeekID == y.DayOfWeekID &&
                x.DeliveryCutOff == y.DeliveryCutOff &&
                x.HasDelivery == y.HasDelivery &&
                x.IncrementDeliveryByDays == y.IncrementDeliveryByDays &&
                x.DeliveryDateExceptions.SequenceEqual(y.DeliveryDateExceptions, new DeliveryDateExceptionsComparer());
        }

        public int GetHashCode(DeliveryDateDefault obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class DeliveryDateExceptionsComparer : IEqualityComparer<DeliveryDateException>
    {
        public bool Equals(DeliveryDateException x, DeliveryDateException y)
        {
            return x.CutOffString == y.CutOffString &&
                x.DeliveryCutOff == y.DeliveryCutOff &&
                x.HasDelivery == y.HasDelivery &&
                x.IncrementDeliveryByDays == y.IncrementDeliveryByDays &&
                x.Date == y.Date;
        }

        public int GetHashCode(DeliveryDateException obj)
        {
            throw new NotImplementedException();
        }
    }
}