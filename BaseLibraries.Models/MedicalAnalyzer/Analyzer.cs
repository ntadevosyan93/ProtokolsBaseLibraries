using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class Analyzer
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(text))]
        public string text { get; set; }

        [ColumnMap(nameof(ip))]
        public string ip { get; set; }

        [ColumnMap(nameof(port))]
        public int? port { get; set; }

        [ColumnMap(nameof(status))]
        public int? status { get; set; }

        [ColumnMap(nameof(type))]
        public int? type { get; set; }

        [ColumnMap(nameof(header))]
        public string header { get; set; }

        [ColumnMap(nameof(doSend))]
        public int? doSend { get; set; }

        [ColumnMap(nameof(server_type))]
        public int? server_type { get; set; }

        [ColumnMap(nameof(astm_name))]
        public string astm_name { get; set; }

        [ColumnMap(nameof(astm_pass))]
        public string astm_pass { get; set; }

        [ColumnMap(nameof(is_staging))]
        public byte? is_staging { get; set; }

        [ColumnMap(nameof(lastDateServer))]
        public DateTime? lastDateServer { get; set; }

        [ForeignKey(nameof(type))]
        public AnalyzerType TypeRef { get; set; }
    }
}
