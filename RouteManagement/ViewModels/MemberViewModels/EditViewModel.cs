using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Wddc.Core.Entities.Members;

namespace RouteManagement.ViewModels.MemberViewModels
{
    public class EditViewModel
    {
        [Display(Description = "Assigned Route:")]
        public DropDownListViewModel RouteDropDownList { get; set; }
        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public bool ShippingCharge { get; set; }
        public decimal PetFoodMoney { get; set; }
        public string MemberNumber { get; set; }
        public Member Member { get; internal set; }
        public int MemberSettingID { get; set; }
    }
}