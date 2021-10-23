using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.KAD$EmployeeVectorWork")]
    public class KADEmployeeVectorWork
    {
        [Key]
        public int id { get; set; }

        public int? idm_employee { get; set; }

        public string text { get; set; }

        public bool? del { get; set; }
    }
}
