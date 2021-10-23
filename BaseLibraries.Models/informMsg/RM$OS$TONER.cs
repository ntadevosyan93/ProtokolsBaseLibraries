using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.RM$OS$TONER")]
    public class RM_OS_TONER
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

        [Column("_count")]
        public int? count { get; set; }

        public int? count_blocked { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? del { get; set; }

    }
}
