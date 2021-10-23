using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalysisReference
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(user_in))]
        public string user_in { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(idm_analysis))]
        public int? idm_analysis { get; set; }

        [ColumnMap(nameof(idm_sex))]
        public byte? idm_sex { get; set; }

        [ColumnMap(nameof(age_month_from))]
        public short? age_month_from { get; set; }

        [ColumnMap(nameof(age_month_to))]
        public short? age_month_to { get; set; }

        [ColumnMap(nameof(pregancy_week_from))]
        public short? pregancy_week_from { get; set; }

        [ColumnMap(nameof(pregancy_week_to))]
        public short? pregancy_week_to { get; set; }

        [ColumnMap(nameof(pregancy))]
        public byte? pregancy { get; set; }

        [ColumnMap(nameof(children))]
        public byte? children { get; set; }

        [ColumnMap(nameof(low))]
        public decimal? low { get; set; }

        [ColumnMap(nameof(high))]
        public decimal? high { get; set; }

        [ColumnMap(nameof(interpetation))]
        public string interpetation { get; set; }

        [ColumnMap(nameof(is_good))]
        public byte? is_good { get; set; }

        [ColumnMap(nameof(active))]
        public byte? active { get; set; }

        [ColumnMap(nameof(idm_analyzer))]
        public int? idm_analyzer { get; set; }

        [ColumnMap(nameof(ver))]
        public short? ver { get; set; }

        [ColumnMap(nameof(comment))]
        public string comment { get; set; }

        [ColumnMap(nameof(user_cur))]
        public string user_cur { get; set; }

        [ColumnMap(nameof(date_cur))]
        public DateTime? date_cur { get; set; }

        [ForeignKey(nameof(idm_analysis))]
        public virtual Analysis AnalysisRef { get; set; }

        [ForeignKey(nameof(idm_analyzer))]
        public virtual Analyzer AnalyzerRef { get; set; }

    }
}
