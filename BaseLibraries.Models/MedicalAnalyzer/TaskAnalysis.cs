using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TaskAnalysis
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(idm_task))]
        public int? idm_task { get; set; }

        [ColumnMap(nameof(idm_analysis))]
        public int? idm_analysis { get; set; }

        [ColumnMap(nameof(status))]
        public byte? status { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(row_id))]
        public short? row_id { get; set; }

        [ColumnMap(nameof(idm_tube))]
        public int? idm_tube { get; set; }

        [ColumnMap(nameof(uagent))]
        public byte? uagent { get; set; }

        [ColumnMap(nameof(row_key))]
        public string row_key { get; set; }

        [ColumnMap(nameof(idm_tube_analysis))]
        public int? idm_tube_analysis { get; set; }

        [ColumnMap(nameof(comment))]
        public string comment { get; set; }

        [ColumnMap(nameof(user_cur))]
        public string user_cur { get; set; }

        [ColumnMap(nameof(date_cur))]
        public DateTime? date_cur { get; set; }

        [ColumnMap(nameof(date_export))]
        public DateTime? date_export { get; set; }

        [ColumnMap(nameof(res_flag))]
        public byte? res_flag { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_plan { get; set; }

        [ColumnMap(nameof(idm_analyzer_dst))]
        public int? idm_analyzer_dst { get; set; }

        [ColumnMap(nameof(user_in))]
        public string user_in { get; set; }

        [ColumnMap(nameof(res_interpretation))]
        public string res_interpretation { get; set; }

        [ColumnMap(nameof(date_update))]
        public DateTime? date_update { get; set; }

        [ColumnMap(nameof(cur_work_start))]
        public DateTime? cur_work_start { get; set; }

        [ColumnMap(nameof(cur_work_analyzer))]
        public DateTime? cur_work_analyzer { get; set; }

        [ColumnMap(nameof(cito))]
        public byte? cito { get; set; }

        [ColumnMap(nameof(date_export_start))]
        public DateTime? date_export_start { get; set; }

        [ColumnMap(nameof(guid))]
        public string guid { get; set; }

        [ColumnMap(nameof(date_validation))]
        public DateTime? date_validation { get; set; }

        [ColumnMap(nameof(idm_biomaterial))]
        public int? idm_biomaterial { get; set; }
    }
}
