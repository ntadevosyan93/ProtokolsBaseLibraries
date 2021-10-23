using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.RM$ACCESSORIES")]
    public class RMACCESSORIES :IHistory
{
	    [Key]
        public int id { get; set; }


        public string user_in { get; set; }


        public DateTime? date_in { get; set; }


        public string text { get; set; }


        public int? idm_billing { get; set; }


        public int? idm_out_tt { get; set; }


        public string out_text { get; set; }


        public byte? status_cor { get; set; }


        public byte? del { get; set; }


        public string user_cor { get; set; }


        public DateTime? date_cor { get; set; }

        [NotMapped]
        public string user_cur { get { return user_cor; } set { user_cor = value; } }

        [NotMapped]
        public DateTime? date_cur { get { return date_cor;  } set { date_cor = value; } }




    }
}
