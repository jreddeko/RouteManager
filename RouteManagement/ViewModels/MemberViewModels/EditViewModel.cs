using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Wddc.Resources.DB;
using Wddc.Resources.DB.AscTrac;
using Wddc.Resources.DB.GreatPlains;
using Wddc.Resources.Entities;

namespace RouteManagement.ViewModels.MemberViewModels
{
    public class EditViewModel
    {
        public int ID { get; set; }
        [Display(Description = "Assigned Route:")]
        public DropDownListViewModel RouteDropDownList { get; set; }
        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public bool ShippingCharge { get; set; }
        public decimal? PetFoodMoney { get; set; }
        public string CustomerNumber { get; set; }
        public Member Member { get; internal set; }
    }
}