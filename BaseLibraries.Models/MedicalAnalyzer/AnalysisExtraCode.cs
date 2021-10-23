using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalysisExtraCode
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(user_in))]
        public string user_in { get; set; }

        [ColumnMap(nameof(idm_analysis))]
        public int? idm_analysis { get; set; }

        [ColumnMap(nameof(code))]
        public string code { get; set; }

        [ColumnMap(nameof(idm_analyzer))]
        public int? idm_analyzer { get; set; }

        [ColumnMap(nameof(active))]
        public byte? active { get; set; }

        [ColumnMap(nameof(date_cur))]
        public DateTime? date_cur { get; set; }

        [ColumnMap(nameof(user_cur))]
        public string user_cur { get; set; }

        [ColumnMap(nameof(IsSimple))]
        public int? IsSimple { get; set; }
    }
}
