using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.View$Sogl")]
    public class View_Sogl
    {
        [Key]
        public int id { get; set; }

        public int? idm_bill { get; set; }

        public int? idm_otdel { get; set; }

        public DateTime? date_reason { get; set; }

        public string user_reason { get; set; }

        public string fio_short { get; set; }

        public string res_reason { get; set; }

        public string text_reason { get; set; }

        public string res_otdel { get; set; }
    }
}
