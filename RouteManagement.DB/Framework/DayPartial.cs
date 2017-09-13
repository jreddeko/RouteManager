using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RouteManagement.DB.Framework
{
    public partial class Day : IDay
    {
        public string CutOffString
        {
            get { return this.CutOff.ToString(@"hh\:mm"); }
            set
            {
                var hours = Int32.Parse(value.Split(':')[0]);
                var minutes = Int32.Parse(value.Split(':')[1]);
                this.CutOff = new TimeSpan(hours, minutes, 0);
            }
        }
    }
}
