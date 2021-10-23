using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.TT$SPR_REGION")]
    public class TT_SPR_REGION:IId
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

    }

}
