using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TasksFlag
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime date_in { get; set; }

        [ColumnMap(nameof(idm_tasks))]
        public int idm_tasks { get; set; }

        [ColumnMap(nameof(idm_metric))]
        public string idm_metric { get; set; }

        [ColumnMap(nameof(metric_value))]
        public string metric_value { get; set; }
    }
}
