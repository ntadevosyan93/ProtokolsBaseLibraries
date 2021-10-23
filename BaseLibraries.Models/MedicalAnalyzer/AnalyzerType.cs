using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class AnalyzerType
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(text))]
        public string text { get; set; }

        [ColumnMap(nameof(prototocol))]
        public short? prototocol { get; set; }

        public virtual List<Analyzer> Analyzers { get; set; }

        public AnalyzerType()
        {
            Analyzers = new List<Analyzer>();
        }
    }
}
