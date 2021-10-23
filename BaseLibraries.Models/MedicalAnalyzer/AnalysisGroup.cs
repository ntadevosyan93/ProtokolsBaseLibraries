using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalysisGroup
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(descr))]
        public string descr { get; set; }
    }
}
