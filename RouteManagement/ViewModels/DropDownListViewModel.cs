using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RouteManagement.ViewModels
{
    public class DropDownListViewModel
    {
        public string SelectedValue { get; set; }
        public IEnumerable<SelectListItem> Items { get; set; }

        public bool OnChangeSubmit = false;
    }
}