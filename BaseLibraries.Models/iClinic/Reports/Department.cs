using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Reports
{
    public class Department : IPremitive
    {
        [ReportField("Наименование организации")]
        public string Organization { get; set; }

        [ReportField("Адрес")]
        public string Address { get; set; }
    }
}
