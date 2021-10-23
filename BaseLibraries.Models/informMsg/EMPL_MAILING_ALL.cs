using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.EMPL_MAILING_ALL")]
    public class EMPL_MAILING_ALL
    {
        [Key]
        public int id { get; set; }

        public int? idm_klass { get; set; }

        public int? idm_empl { get; set; }

        public int? idm_owner { get; set; }

        public int? del { get; set; }

    }
}
