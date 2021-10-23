using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.RM$BUDGET$GROUPINGS")]
    public class RM_BUDGET_GROUPINGS
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

        public int? ParentID { get; set; }

        public int? idm_depart { get; set; }

        public int? idm_group { get; set; }

        public bool? del { get; set; }

        public bool actual { get; set; }

        public short? type_group { get; set; }
    }
}
