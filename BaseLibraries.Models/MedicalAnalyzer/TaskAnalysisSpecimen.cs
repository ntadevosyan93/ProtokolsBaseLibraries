using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TaskAnalysisSpecimen
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(idm_analysis))]
        public int? idm_analysis { get; set; }

        [ColumnMap(nameof(code_specimen))]
        public string code_specimen { get; set; }

        [ColumnMap(nameof(task_1c_num))]
        public string task_1c_num { get; set; }

        [ColumnMap(nameof(task_1c_date))]
        public DateTime? task_1c_date { get; set; }

    }
}
