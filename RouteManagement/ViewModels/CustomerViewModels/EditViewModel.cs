using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Wddc.Core.Entities.EdiOrdering.Customers;

namespace RouteManagement.ViewModels.CustomerViewModels
{
    public class EditViewModel
    {
        [Display(Name = "Assigned Route:")]
        public DropDownListViewModel RouteDropDownList { get; set; }

        [Display(Name = "Delayed Billing:")]
        public DropDownListViewModel DelayedBillingDropDownList { get; set; }

        [Display(Name = "Pet Food:")]
        public DropDownListViewModel PetFoodDropDownList { get; set; }

        [Display(Name = "Shipping Charge:")]
        public bool ShippingCharge { get; set; }

        [Display(Name = "Financial Hold:")]
        public bool HasFinancialHold { get; set; }

        [Display(Name = "Pet Food:")]
        public decimal PetFoodMoney { get; set; }
        public string CustomerId { get; set; }
        public Customer Customer { get; internal set; }
        public int CustomerSettingID { get; set; }
    }
}