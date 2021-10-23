using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TubeAnalysisExternal
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime date_in { get; set; }

        [ColumnMap(nameof(user_in))]
        public string user_in { get; set; }

        [ColumnMap(nameof(idm_task_analysis))]
        public int? idm_task_analysis { get; set; }

        [ColumnMap(nameof(idm_tube))]
        public int? idm_tube { get; set; }

        [ColumnMap(nameof(external_code))]
        public string external_code { get; set; }

        [ColumnMap(nameof(text_code))]
        public string text_code { get; set; }

        [ColumnMap(nameof(status))]
        public int? status { get; set; }

        [ColumnMap(nameof(res_value))]
        public string res_value { get; set; }

        [ColumnMap(nameof(res_value_str))]
        public string res_value_str { get; set; }

        [ColumnMap(nameof(res_unit))]
        public string res_unit { get; set; }

        [ColumnMap(nameof(res_flag))]
        public byte? res_flag { get; set; }

        [ColumnMap(nameof(res_conclusion))]
        public string res_conclusion { get; set; }

        [ColumnMap(nameof(res_reference_text))]
        public string res_reference_text { get; set; }

        [ColumnMap(nameof(parent_id))]
        public int? parent_id { get; set; }
    }
}
