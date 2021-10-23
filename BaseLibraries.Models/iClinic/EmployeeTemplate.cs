using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{

    public class EmployeeTemplate
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [ColumnMap("forall")]
        public int? forall { get; set; }

        [ColumnMap("idm_empl")]
        public int? idm_empl { get; set; }

        [ColumnMap("idm_protocol")]
        public int? idm_protocol { get; set; }

        [ColumnMap("sort_idx")]
        public int? sort_idx { get; set; }

        [StringLength(1024)]
        [ColumnMap("title")]
        public string title { get; set; }

        [ColumnMap("text")]
        public string text { get; set; }

        public string Name { get { return string.IsNullOrEmpty(text) ? string.Empty : text.Replace("\r\n", " ").Trim(); } }

        public override string ToString()
        {
            return text;
        }
    }
}
