using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.DEPARTMENTS_OFFICES")]
    public class DEPARTMENTS_OFFICES
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

        public int? idm_department { get; set; }

        public int? del { get; set; }

    }
}
