using System;

namespace RouteManagement.Models.RouteManagement
{
    public class DayDeleteMe
    {
        public DayDeleteMe(DateTime dateTime)
        {
            this.Date = dateTime.ToString();
        }

        public DayDeleteMe() { }

        public bool HasDelivery { get; set; }
        public int IncrementByDays { get; set; }

        private DateTime _cutoff;
        public string CutOff
        {
            get { return _cutoff.ToString(); }
            set { _cutoff = DateTime.Parse(value); }
        }

        private DateTime _date;
        public string Date
        {
            get { return _date.ToString(); }
            set { _date = DateTime.Parse(value); }
        }

        public int GetDay
        {
            get { return this._date.Day; }            
        }

        public string GetDayName
        {
            get { return this._date.ToString("dddd"); }
        }

        public string GetCutOff
        {
            get { return this._cutoff.ToString("hh:mm");  }
        }
    }
}