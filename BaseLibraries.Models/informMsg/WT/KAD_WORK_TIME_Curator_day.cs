
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.WT
{
    [Table("dbo.KAD$WORK_TIME_Curator_day")]
    public class KAD_WORK_TIME_Curator_day
    {
        [Key]
        public string guid { get; set; }

        public string curator { get; set; }

        public string day { get; set; }
    }
}
