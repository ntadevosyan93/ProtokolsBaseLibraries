using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Reports
{
    [ReportField("Данные посещения")]
    public class TaskVisitData : IPremitive
    {
        [ReportField("Номер карты")]
        public string task_num { get; set; }

        [ReportField("Номер договора")]
        public string dog_num { get; set; }

        [ReportField("Дата приема")]
        public DateTime task_date_1c { get; set; }

        [ReportField("Пациент",true)]
        public Patient Patient { get; set; }

        [ReportField("Врач",true)]
        public Employee Employee { get; set; }

        [ReportField("Клинника",true)]
        public Department Department { get; set; }

        [ReportField("Диагноз основного заболевания",true,true)]
        public IEnumerable<Diagnosis> BaseDiagnosis { get; set; }

        [ReportField("Диагнозы сопутсвующих заболеваний",true,true)]
        public IEnumerable<Diagnosis> SateliteDiagnosis { get; set; }

        [ReportField("Внешнии причины при травме",true,true)]
        public IEnumerable<Diagnosis> OutClouseDamage { get; set; }

    }
}
