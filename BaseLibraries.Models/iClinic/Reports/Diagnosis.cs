using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Reports
{
    public class Diagnosis : IPremitive
    {

        [ReportField("Код по мкб")]
        public string mkb_code { get; set; }

        [ReportField("наименование по мкб")]
        public string mkb_name { get; set; }

        [ReportField("Описание")]
        public string description { get; set; }
    }
}
