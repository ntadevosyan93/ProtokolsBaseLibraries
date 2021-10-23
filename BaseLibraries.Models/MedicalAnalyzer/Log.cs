using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class Log
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(ip))]
        public string ip { get; set; }

        [ColumnMap(nameof(idm_analyzer))]
        public int? idm_analyzer { get; set; }

        [ColumnMap(nameof(port))]
        public int? port { get; set; }

        [ColumnMap(nameof(text))]
        public string text { get; set; }

        [ColumnMap(nameof(is_work))]
        public byte? is_work { get; set; }

        [ColumnMap(nameof(err))]
        public byte? err { get; set; }
    }

}
