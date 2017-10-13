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
        [Display(Description = "Assigned Route:")]
        public DropDownListViewModel RouteDropDownList { get; set; }
        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public bool ShippingCharge { get; set; }
        public decimal PetFoodMoney { get; set; }
        public string CustomerId { get; set; }
        public Customer Customer { get; internal set; }
        public int CustomerSettingID { get; set; }
    }
}