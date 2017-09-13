using System;

namespace RouteManagement.DB.Framework
{
    public interface IDay
    {
        TimeSpan CutOff { get; set; }
        string CutOffString { get; set; }
        int DateOfWeek { get; set; }
        int DayID { get; set; }
        bool HasDelivery { get; set; }
        int IncrementByDays { get; set; }
        int SiteOrderTypeID { get; set; }
    }
}