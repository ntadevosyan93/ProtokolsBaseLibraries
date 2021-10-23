using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.EMPL_MAILING_LIST")]
    public class EMPL_MAILING_LIST :IHistory
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public string db_table_name { get; set; }

        public int? db_table_id { get; set; }

        public byte? IsSend { get; set; }

        public int? idm_empl { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public byte? del { get; set; }

    }
}
