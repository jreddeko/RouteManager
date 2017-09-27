﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wddc.Resources.DB.Routing;

namespace RouteManagement.ViewModels.RouteViewModels
{
    public class AddRouteViewModel
    {
        [Display(Description = "Clone Route:")]
        public DropDownListViewModel RouteDropDownList { get; set; }

        [Required]
        public int RouteNumber { get; set; }

        [Required]
        public string Description { get; set; }

        public AddRouteViewModel()
        {
            var service = new RoutingService();
            RouteDropDownList = new ViewModels.DropDownListViewModel()
            {
                Items = service.GetAllRoutes()
                        .Select(r => new SelectListItem()
                        {
                            Text = String.Format("{0}: #{1}", r.Description, r.RouteNumber),
                            Value = r.RouteID.ToString(),
                        }),
                SelectedValue = null,
            };
        }
    }
}