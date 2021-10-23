using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class EmployeeTemplateContent 
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [ColumnMap("idm_template")]
        public int? idm_template { get; set; }

        [ColumnMap("sort_idx")]
        public int? sort_idx { get; set; }

        [ColumnMap("text")]
        public string text { get; set; }

        [ColumnMap("AllowPharm")]
        public int? AllowPharm { get; set; }

        [ColumnMap("date_cor")]
        public DateTime? date_cor { get; set; }

        public string Name { get { return string.IsNullOrEmpty(text) ? string.Empty : text.Replace("\r\n", " ").Trim(); } }

        public override string ToString()
        {
            return Name;
        }
        
    }
}
