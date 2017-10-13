
namespace RouteManagement.ViewModels.CustomerViewModels
{
    public class AddViewModel
    {
        public AddViewModel()
        {
        }

        public DropDownListViewModel DelayedBillingDropDownList { get; set; }
        public string CustomerId { get; set; }
        public DropDownListViewModel PetFoodDropDownList { get; set; }
        public DropDownListViewModel RouteDropDownList { get; set; }
        public decimal PetFoodMoney { get; set; }
        public bool ShippingCharge { get; set; }
        public string CustomerName { get; set;}
    }
}