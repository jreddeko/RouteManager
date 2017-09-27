using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RouteManagement.Models
{
    public class CalendarDay
    {
        public static int GetDayOfWorkWeek(DateTime date)
        {
            switch (date.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    return 1;
                case DayOfWeek.Monday:
                    return 2;
                case DayOfWeek.Tuesday:
                    return 3;
                case DayOfWeek.Wednesday:
                    return 4;
                case DayOfWeek.Thursday:
                    return 5;
                case DayOfWeek.Friday:
                    return 6;
                case DayOfWeek.Saturday:
                    return 7;
            }
            throw new Exception("DayOfWorkWeek not defined for date: " + date.ToString());
        }
        public DateTime Date;
        public string ShortName { get { return Date.ToString("ddd"); } }
        public string Name { get { return Date.ToString("dddd"); } }
        public int Day { get { return Date.Day; } }
        public int DayOfWorkWeek
        {
            get
            {
                return GetDayOfWorkWeek(Date);
            }

        }
        public string DateString
        {
            get
            {
                return this.Date.ToString("yyyy-MM-dd");
            }
        }

        public CalendarDay(DateTime date)
        {
            this.Date = date;
        }
    }

    public class Calendar
    {
        public Calendar()
        {
            var date = DateTime.Now;
            while (date.DayOfWeek != DayOfWeek.Sunday)
            {
                date = date.AddDays(-1);
            }
            this.FirstDayOfWeek = date;
        }

        public Calendar(DateTime date)
        {
            while (date.DayOfWeek != DayOfWeek.Sunday)
            {
                date = date.AddDays(-1);
            }
            this.FirstDayOfWeek = date;
        }
        public CalendarDay[] Week
        {
            get
            {
                var calendarWeek = new CalendarDay[7];
                var date = FirstDayOfWeek;
                for (int i = 0; i < 7; i++)
                {
                    calendarWeek[i] = new CalendarDay(date);
                    date = date.AddDays(1);
                }
                return calendarWeek;
            }
        }
        public DateTime FirstDayOfWeek { get; private set; }

        public DateTime NextWeek()
        {
            return this.FirstDayOfWeek.AddDays(7);
        }
        public DateTime PreviousWeek()
        {
            return this.FirstDayOfWeek.AddDays(-7);
        }
        private void addDays(int days)
        {
            FirstDayOfWeek = FirstDayOfWeek.AddDays(days);
        }
    }
}