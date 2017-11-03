using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Wddc.Core.Entities.EdiOrdering.Customers;
using System.ComponentModel.DataAnnotations;

namespace RouteManagement.ViewModels.CustomerViewModels
{
    public class IndexViewModel
    {
        public IPagedList<Customer> Customers { get; set; }

        [Display(Name = "Pet Food")]
        public IList<SelectListItem> AvailablePetFoodOptions { get; set; }

        [Display(Name = "Billing Options")]
        public IList<SelectListItem> AvailableDelayedBillingOptions { get; set; }

        [Display(Name = "Shipping Charge")]
        public IList<SelectListItem> AvailableShippingChargeOptions { get; set; }

        [Display(Name = "Setup State")]
        public IList<SelectListItem> AvailableSetupStateOptions { get; set; }

        [Display(Name = "Financial Hold")]
        public IList<SelectListItem> AvailableFinancialHoldOptions { get; set; }

        [Display(Name = "Assigned Route")]
        public IList<SelectListItem> AvailableRouteOptions { get; set; }

        [Display(Name = "Sort")]
        public IList<SelectListItem> AvailableSortOptions { get; set; }

        public int? SortId { get; set; }
        public int? SearchShippingChargeId { get; set; }
        public int? SearchDelayedBillingId { get; set; }
        public int? SearchRouteId { get; set; }
        public int? SearchPetFoodId { get; set; }
        public int? SearchSetupStateId { get; set; }
        public string Search { get; set; }
        public int? Page { get; set; }
        public int? SearchFinancialHoldId { get; set; }

        public IndexViewModel()
        {
            AvailablePetFoodOptions = new List<SelectListItem>();
            AvailableDelayedBillingOptions = new List<SelectListItem>();
        }
    }
}