using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.TT$SPR_REGION_EMPL")]
    public class TT_SPR_REGION_EMPL
    {
        public int id { get; set; }

        public int? idm_region { get; set; }

        public int? idm_empl { get; set; }

    }
}
