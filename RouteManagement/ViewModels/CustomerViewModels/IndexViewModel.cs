using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Wddc.Core.Entities.EdiOrdering.Customers;

namespace RouteManagement.ViewModels.CustomerViewModels
{
    public class IndexViewModel
    {
        public IPagedList<Customer> Customers { get; set; }
        public SetupState SetupState { get; set; }
        public string Search { get; set; }
        public DropDownListViewModel SetupStatesDropDownList { get; set; }
        public int Page { get; set; }
    }
}