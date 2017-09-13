using System;

namespace RouteManagement.Models.RouteManagement
{
    public class OrderTypeDeleteMe
    {
        public OrderTypeDeleteMe(int orderTypeID, string name)
        {
            this.OrderTypeID = orderTypeID;
            this.Name = name;
        }
        public OrderTypeDeleteMe() { }

        public DayDeleteMe[] Days { get; set; }
        public string Name { get; private set; }
        public int OrderTypeID { get; private set; }
    }
}