using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.WT
{
    [Table("dbo.KAD$WORK_TIME_TARDINESS")]
    public class KADWORK_TIME_TARDINESS
    {
        [Key]
        public int id { get; set; }

        public bool? sb { get; set; }

        public string prichina { get; set; }

        public bool? del { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

    }
}
