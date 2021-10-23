using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.WT
{

        [Table("dbo.KAD$WORK_TIME_CURATORS")]
        public class KAD_WORK_TIME_CURATORS
        {
            [Key]
            public int id { get; set; }

            public DateTime? date_in { get; set; }

            public string user_in { get; set; }

            public int? idm_curator { get; set; }

            public int? idm_empl { get; set; }

        }

}
