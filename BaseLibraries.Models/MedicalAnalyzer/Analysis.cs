using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class Analysis
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(text))]
        public string text { get; set; }

        [ColumnMap(nameof(code))]
        public string code { get; set; }

        [ColumnMap(nameof(parent_id))]
        public int? parent_id { get; set; }

        [ColumnMap(nameof(id_1c))]
        public string id_1c { get; set; }

        [ColumnMap(nameof(idm_ed))]
        public int? idm_ed { get; set; }

        [ColumnMap(nameof(idm_color))]
        public int? idm_color { get; set; }

        [ColumnMap(nameof(classifier))]
        public string classifier { get; set; }

        [ColumnMap(nameof(formula))]
        public string formula { get; set; }

        [ColumnMap(nameof(idm_type))]
        public byte? idm_type { get; set; }

        [ColumnMap(nameof(interpretaion_need))]
        public byte? interpretaion_need { get; set; }

        [ColumnMap(nameof(comment))]
        public string comment { get; set; }

        [ColumnMap(nameof(idm_group))]
        public int? idm_group { get; set; }

        [ColumnMap(nameof(idm_biomaterial))]
        public byte? idm_biomaterial { get; set; }

        [ColumnMap(nameof(guid))]
        public string guid { get; set; }

        [ColumnMap(nameof(sorting_id))]
        public int? sorting_id { get; set; }

        [ColumnMap(nameof(id_1cExt))]
        public string id_1cExt { get; set; }

        [ColumnMap(nameof(allow_confirm_zero))]
        public bool? allow_confirm_zero { get; set; }
    }
}
