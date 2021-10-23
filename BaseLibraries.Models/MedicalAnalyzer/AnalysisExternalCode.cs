using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalysisExternalCode
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(descr))]
        public string descr { get; set; }

        [ColumnMap(nameof(code))]
        public string code { get; set; }
    }
}
