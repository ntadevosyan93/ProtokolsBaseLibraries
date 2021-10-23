using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.PSY
{
    [Table("dbo.View$Psy_load")]
    public class View_Psy_load
    {
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public string ip_in { get; set; }

        public string fio { get; set; }

    }
}
