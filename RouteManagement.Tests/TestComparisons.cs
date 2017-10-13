using System;
using System.Collections.Generic;
using System.Linq;
using Wddc.Core.Entities.EdiOrdering.Routes;
using Wddc.Data;

namespace RouteManagement.Tests
{
    internal class RouteSiteComparer : IEqualityComparer<RouteSiteDTO>
    {
        public bool Equals(RouteSiteDTO x, RouteSiteDTO y)
        {
            return x.SiteID == y.SiteID && 
                x.SiteOrderTypes.SequenceEqual(y.SiteOrderTypes, new SiteOrderTypesComparer());
        }

        public int GetHashCode(RouteSiteDTO obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class CustomerSettingsComparer : IEqualityComparer<CustomerSettingDTO>
    {
        public bool Equals(CustomerSettingDTO x, CustomerSettingDTO y)
        {
            return x.DelayedBillingID == y.DelayedBillingID &&
                x.HasFinancialHold == y.HasFinancialHold &&
                x.HasShippingCharge == y.HasShippingCharge &&
                x.CustomerId == y.CustomerId &&
                x.PetFoodID == y.PetFoodID &&
                x.PetFoodMoney == y.PetFoodMoney;
        }

        public int GetHashCode(CustomerSettingDTO obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class SiteOrderTypesComparer : IEqualityComparer<SiteOrderTypeDTO>
    {
        public bool Equals(SiteOrderTypeDTO x, SiteOrderTypeDTO y)
        {
            return x.OrderTypeID == y.OrderTypeID && 
                x.DeliveryDateDefaults.SequenceEqual(y.DeliveryDateDefaults, new DeliveryDateDefaultsComparer());
        }

        public int GetHashCode(SiteOrderTypeDTO obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class DeliveryDateDefaultsComparer : IEqualityComparer<DeliveryDateDefaultDTO>
    {
        public bool Equals(DeliveryDateDefaultDTO x, DeliveryDateDefaultDTO y)
        {
            return x.CutOffString == y.CutOffString &&
                x.DayOfWeekID == y.DayOfWeekID &&
                x.DeliveryCutOff == y.DeliveryCutOff &&
                x.HasDelivery == y.HasDelivery &&
                x.IncrementDeliveryByDays == y.IncrementDeliveryByDays &&
                x.DeliveryDateExceptions.SequenceEqual(y.DeliveryDateExceptions, new DeliveryDateExceptionsComparer());
        }

        public int GetHashCode(DeliveryDateDefaultDTO obj)
        {
            throw new NotImplementedException();
        }
    }

    internal class DeliveryDateExceptionsComparer : IEqualityComparer<DeliveryDateExceptionDTO>
    {
        public bool Equals(DeliveryDateExceptionDTO x, DeliveryDateExceptionDTO y)
        {
            return x.CutOffString == y.CutOffString &&
                x.DeliveryCutOff == y.DeliveryCutOff &&
                x.HasDelivery == y.HasDelivery &&
                x.IncrementDeliveryByDays == y.IncrementDeliveryByDays &&
                x.Date == y.Date;
        }

        public int GetHashCode(DeliveryDateExceptionDTO obj)
        {
            throw new NotImplementedException();
        }
    }
}