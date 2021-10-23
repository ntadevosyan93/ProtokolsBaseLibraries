using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.WT
{
    [Table("dbo.KAD$WORK_TIME_Date")]
    public class KadWork_Time_Date
    {
        [Key]
        public DateTime date_send { get; set; }

        public string guid { get; set; }
    }
}
