using Clinic.Development;
using System;

namespace BaseLibraries.Helpers
{
    public static class DateTimeHelpers
    {
        public static DatePart CalculateAge(DateTime date_birth, DateTime target)
        {
            try
            {
                DateTime dateTime1 = DateTime.Now;
                TimeSpan timeSpan = dateTime1.Subtract(date_birth);
                dateTime1 = new DateTime(timeSpan.Ticks);
                int num = dateTime1.Year - 1;
                DateTime dateTime2 = date_birth.AddYears(num);
                int months1 = 0;
                for (int months2 = 1; months2 <= 12; ++months2)
                {
                    if (dateTime2.AddMonths(months2) == target)
                    {
                        months1 = months2;
                        break;
                    }
                    if (dateTime2.AddMonths(months2) >= target)
                    {
                        months1 = months2 - 1;
                        break;
                    }
                }
                timeSpan = target.Subtract(dateTime2.AddMonths(months1));
                int days = timeSpan.Days;
                return new DatePart()
                {
                    Days = days,
                    Months = months1,
                    Years = num
                };
            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                return new DatePart()
                {
                    Days = 0,
                    Months = 0,
                    Years = 0
                };
            }
        }

        public static int CalcDiffDay(DateTime? begin, DateTime? end)
        {
            if (!begin.HasValue || !end.HasValue)
                return -1;
            return begin.Value.Subtract(end.Value).Days;
        }

        public static DatePart AsDatePart(this DateTime date)
        {
            try
            {
                return new DatePart()
                {
                    Day = date.Day.ToString(),
                    MonthName = date.ToString("MMMM"),
                    Year = date.Year.ToString(),
                    H = date.ToString("HH"),
                    M = date.ToString("mm")
                };
            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                return new DatePart()
                {
                    Days = 0,
                    Months = 0,
                    Years = 0
                };
            }
        }

        public static DatePart AsDatePart(this DateTime? date)
        {
            return (!date.HasValue ? new DateTime(1899, 12, 31) : date.Value).AsDatePart();
        }
    }

    public struct DatePart
    {
        public int Days;
        public int Months;
        public int Years;
        public string Day;
        public string MonthName;
        public string Year;
        public string H;
        public string M;
    }
}



