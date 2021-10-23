using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalysisFlagView
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(idm_status))]
        public int? idm_status { get; set; }

        [ColumnMap(nameof(view_string))]
        public string view_string { get; set; }
    }
}
