using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class Spec
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(9)]
        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(150)]
        [ColumnMap("text")]
        public string text { get; set; }

        [ColumnMap("child")]
        public int? child { get; set; }

        [ColumnMap("hide")]
        public int? hide { get; set; }

        [ColumnMap("del")]
        public int? del { get; set; }

        [ColumnMap("date_cor")]
        public DateTime? date_cor { get; set; }
    }
}
