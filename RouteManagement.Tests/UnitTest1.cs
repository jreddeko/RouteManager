using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Globalization;

namespace Wddc.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            var Dates = new DateTime[7];
            var date = DateTime.Now;
            while (date.DayOfWeek != DayOfWeek.Sunday)
            {
                date = date.AddDays(-1);
            }
            for (int i = 0; i < 7; i++)
            {
                Dates[i] = date;
                date = date.AddDays(1);
            }

        }
    }
}
