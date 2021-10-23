using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class EmployeeContentPharm
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [StringLength(50)]
        [ColumnMap("user_in")]
        public string user_in { get; set; }

        [ColumnMap("idm_template")]
        public int? idm_template { get; set; }

        [ColumnMap("idm_pharm")]
        public int? idm_pharm { get; set; }

        [ColumnMap("count")]
        public decimal? count { get; set; }
    }
}
