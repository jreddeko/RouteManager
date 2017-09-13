namespace RouteManagement.Models.RouteManagement
{
    public class SiteDeleteMe
    {
        public SiteDeleteMe(int siteID, string name, OrderTypeDeleteMe[] orderTypes)
        {
            this.SiteID = SiteID;
            this.Name = name;
            this.OrderTypes = orderTypes;
        }
        public SiteDeleteMe() { }
        public int SiteID { get; set; }
        public string Name { get; set; }
        public OrderTypeDeleteMe[] OrderTypes { get; set; }
    }
}