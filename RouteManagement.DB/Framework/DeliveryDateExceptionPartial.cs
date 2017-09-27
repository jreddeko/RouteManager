using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wddc.DB.Framework
{
    public partial class DeliveryDateException
    {
        public string DateString
        {
            get
            {
                return this.Date.ToString("yyyy-MM-dd");
            }
            set

            {
                this.Date = DateTime.Parse(value);
            }
        }

        public string CutOffString
        {
            get
            {
                return this.DeliveryCutOff?.ToString(@"hh\:mm");
            }
            set
            {
                if (value == null || !value.Contains(":"))
                    this.DeliveryCutOff = null;
                else
                {
                    var hours = Int32.Parse(value.Split(':')[0]);
                    var minutes = Int32.Parse(value.Split(':')[1]);
                    this.DeliveryCutOff = new TimeSpan(hours, minutes, 0);
                }
            }
        }
    }
}
