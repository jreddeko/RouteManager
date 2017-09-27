using Wddc.Resources.Entities;

namespace RouteManagement.ViewModels.MemberViewModels
{
    public class AddViewModel
    {
        public AddViewModel()
        {
        }

        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public string MemberNumber { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public DropDownListViewModel RouteDropDownList { get; set; }
        public decimal PetFoodMoney { get; set; }
        public bool ShippingCharge { get; set; }
        public string MemberName { get; set;}
    }
}