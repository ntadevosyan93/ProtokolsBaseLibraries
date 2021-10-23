using BaseLibraries.Interfaces;
using System.ComponentModel;

namespace BaseLibraries.Models.iClinic.Reports
{
    public class Address : IPremitive
    {
        [ReportField("Субъект РФ")]
        public string Region { get; set; }

        [ReportField("Район")]
        public string Area { get; set; }

        [ReportField("Населенный пункт")]
        public string City { get; set; }

        [ReportField("Улица")]
        public string Street { get; set; }

        [ReportField("Дом")]
        public string House { get; set; }

        [ReportField("Помещение")]
        public string Office { get; set; }

        public override string ToString()
        {
            string value = PrepareValue(Region) 
                + PrepareValue(City) 
                + PrepareValue(Area) 
                + PrepareValue(Street) 
                + PrepareValue(House) 
                + PrepareValue(Office);

            return string.IsNullOrWhiteSpace(value) ? "н\\у" : value;
        }

        string PrepareValue(string value)
        {
            return string.IsNullOrEmpty(value) ? " " : value + ", ";
        }
    }
}
