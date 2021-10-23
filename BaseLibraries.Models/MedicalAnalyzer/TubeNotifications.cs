using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class TubeNotifications
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(idm_log))]
        public int? idm_log { get; set; }

        [ColumnMap(nameof(idm_analyzer))]
        public int? idm_analyzer { get; set; }

        [ColumnMap(nameof(idm_tube))]
        public int? idm_tube { get; set; }

        [ColumnMap(nameof(notice_raw))]
        public string notice_raw { get; set; }

        [ColumnMap(nameof(notice))]
        public string notice { get; set; }

        [ColumnMap(nameof(is_work))]
        public byte? is_work { get; set; }
    }
}

