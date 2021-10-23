using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Reports
{
    [ReportField("Данные мед.карты")]
    public class MedCardData : IPremitive
    {
        [ReportField("Пациент", true)]
        public Patient Patient { get; set; }

    }
}
