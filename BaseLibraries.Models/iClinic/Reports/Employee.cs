using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Reports
{

    public class Employee : IPremitive
    {
        [ReportField("Данные ФИО",true)]
        public Person Person { get; set; }

        [ReportField("Категория")]
        public string category { get; set; }

        [ReportField("Должность")]
        public string position { get; set; }

        public Employee()
        {
            Person = new Person();
        }
    }
}
