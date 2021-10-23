using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.View$Entlassung_NOT_ACTUAL")]
    public class View_Entlassung_NOT_ACTUAL
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public string fam { get; set; }

        public string name { get; set; }

        public string otch { get; set; }

        public DateTime? data_b { get; set; }

        public string login_ad { get; set; }

        public int? idm_doljn { get; set; }

        public int? idm_otdel { get; set; }

        public int? idm_org { get; set; }

        public int? idm_ent { get; set; }

        [NotMapped]
        public string FullName
        {
            get
            {

                string fm = (fam != null ? fam : "----");
                //string name = (KadEmployee.name != null || KadEmployee.name.Trim().Length > 0 ? KadEmployee.name.Trim().Substring(1, 1) : "?");
                string nm = (string.IsNullOrEmpty(name) ? "?" : (name.Trim().Length == 0 ? "?" : name.Trim().Substring(0, 1)));
                //(string.IsNullOrEmpty(KadEmployee.name) ? "?" : KadEmployee.name.Trim().Substring(1, 1));
                string pt = (string.IsNullOrEmpty(otch) ? "?" : (otch.Trim().Length == 0 ? "?" : otch.Trim().Substring(0, 1)));
                //(KadEmployee.otch != null || KadEmployee.otch.Trim().Length > 0 ? KadEmployee.otch.Trim().Substring(1, 1) : "?");
                return string.Format("{0} {1}. {2}.", fm, nm.ToUpper(), pt.ToUpper());

            }
        }
    }
}
