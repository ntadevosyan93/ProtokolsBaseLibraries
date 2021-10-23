using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.View$KAD$EMPL$ACTUAL")]
    public class View_KAD_EMPL_ACTUAL: IEmployee
    {
        public int id { get; set; }

        public string fam { get; set; }

        public string name { get; set; }

        public string otch { get; set; }

        public string fio_full { get; set; }

        public string fio_short { get; set; }

        public int? idm_bolid { get; set; }

        public int? curator_dog { get; set; }

        public string guid { get; set; }

        public int? id_doljn { get; set; }

        public string phone_mob { get; set; }

        public string doljn_text { get; set; }

        public string email { get; set; }

        public string phone_vn { get; set; }

        public string guid_iclinic { get; set; }

        public bool? isKKB { get; set; }

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
