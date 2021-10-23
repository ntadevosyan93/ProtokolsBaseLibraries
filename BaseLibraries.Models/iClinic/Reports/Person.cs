using BaseLibraries.Helpers;
using BaseLibraries.Interfaces;
using System;

namespace BaseLibraries.Models.iClinic.Reports
{
    public class Person : IPremitive
    {
        [ReportField("Фамилия, имя, отчество")]
        public string fio { get; set; }

        [ReportField("Дата рождения")]
        public DateTime? date_b { get; set; }

        [ReportField("Возраст")]
        public int age {
            get
            {
                int value = -1;
                if (date_b != null)
                {
                    var @struct = DateTimeHelpers.CalculateAge(date_b.Value, DateTime.Now);
                    value = @struct.Years;
                }
                return value;
            }
        }

        [ReportField("Пол")]
        public string  gender { get; set; }

        public override string ToString()
        {
            return fio;
        }
    }
}
