using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.KAD$DOLJN")]
    public class KAD_DOLJN
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

        public DateTime? date_in { get; set; }

        public int? IsDND { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public int? IsDel { get; set; }
    }
}
