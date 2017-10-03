using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.ViewModels.RouteExceptionViewModels
{
    public class IndexViewModel
    {
        public IEnumerable<DateTime> ExceptionDates { get; internal set; }
    }
}