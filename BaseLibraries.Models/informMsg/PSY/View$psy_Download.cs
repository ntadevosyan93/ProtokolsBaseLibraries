using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.PSY
{
    [Table("dbo.View$psy_Download")]
    public class View_psy_Download
    {
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public string ip_in { get; set; }

        public string fio { get; set; }

        public string cand { get; set; }

        public string file_name { get; set; }

        public string doljn { get; set; }

        public string res { get; set; }

    }
}
