using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Wddc.Core.Entities.Members;

namespace RouteManagement.ViewModels.MemberViewModels
{
    public class IndexViewModel
    {
        public Member[] Members { get; set; }
        public SetupState SetupState { get; set; }
        public string NextID { get; set; }
        public string PrevID { get; set; }
        public string Search { get; set; }
        public DropDownListViewModel SetupStatesDropDownList { get; set; }
    }
}