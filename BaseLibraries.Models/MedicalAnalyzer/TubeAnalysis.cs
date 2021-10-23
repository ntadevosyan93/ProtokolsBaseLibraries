using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TubeAnalysis
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(idm_tube))]
        public int? idm_tube { get; set; }

        [ColumnMap(nameof(idm_analysis))]
        public int? idm_analysis { get; set; }

        [ColumnMap(nameof(analysis_code))]
        public string analysis_code { get; set; }

        [ColumnMap(nameof(status))]
        public int? status { get; set; }

        [ColumnMap(nameof(res_value_num))]
        public decimal? res_value_num { get; set; }

        [ColumnMap(nameof(res_value_text))]
        public string res_value_text { get; set; }

        [ColumnMap(nameof(res_value))]
        public string res_value { get; set; }

        [ColumnMap(nameof(ratio))]
        public int? ratio { get; set; }

        [ColumnMap(nameof(res_unit))]
        public string res_unit { get; set; }

        [ColumnMap(nameof(res_flag))]
        public byte? res_flag { get; set; }

        [ColumnMap(nameof(actual))]
        public byte? actual { get; set; }

        [ColumnMap(nameof(idm_log))]
        public int? idm_log { get; set; }

        [ColumnMap(nameof(idm_task_analysis))]
        public int? idm_task_analysis { get; set; }

        [ColumnMap(nameof(IsHandleInput))]
        public byte? IsHandleInput { get; set; }

        [ColumnMap(nameof(user_input))]
        public string user_input { get; set; }

        [ColumnMap(nameof(date_input))]
        public DateTime? date_input { get; set; }

        [ColumnMap(nameof(res_interpretation))]
        public string res_interpretation { get; set; }

        [ColumnMap(nameof(res_reference))]
        public string res_reference { get; set; }

        [ColumnMap(nameof(res_reference_text))]
        public string res_reference_text { get; set; }
    }
}
