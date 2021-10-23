using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.PSY
{
    [Table("dbo.KAD$PSY_TEST_Protocol_CAND")]
    public class KAD_PSY_TEST_Protocol_CAND
    {
        [Key]
        public int id { get; set; }

        public int? idm_empl { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? idm_dolgn { get; set; }

        public string feature_text { get; set; }

        public string relative_empl { get; set; }

        public int? idm_result { get; set; }

        public int? idm_psytest { get; set; }

        public string education { get; set; }

        public DateTime? date_test { get; set; }

        public DateTime? date_cur { get; set; }

        public DateTime? date_start_editing { get; set; }

    }
}
