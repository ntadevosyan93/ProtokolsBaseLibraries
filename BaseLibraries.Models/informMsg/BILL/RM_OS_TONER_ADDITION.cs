using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.RM$OS$TONER_ADDITION")]
    public class RM_OS_TONER_ADDITION:ICreate
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? idm_toner { get; set; }

        public int? count_toner { get; set; }

        public int? idm_billing { get; set; }

        public int? del { get; set; }

    }
}
