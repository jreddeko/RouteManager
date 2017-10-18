using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.ViewModels.CustomerViewModels
{
    public class CustomerFilterOptionsViewModel
    {
        public DropDownListViewModel RouteDropDownList { get; set; }
        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public bool ShippingCharge { get; set; }
    }
}