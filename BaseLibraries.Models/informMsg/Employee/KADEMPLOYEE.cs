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
    public class KadEmployee:IHistory, IEmployee, IGuidClinic,IEmplKey
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public string fam { get; set; }

        public string name { get; set; }

        public string otch { get; set; }

        public DateTime? data_b { get; set; }

        public int? idm_doljn { get; set; }

        public int? idm_otdel { get; set; }

        public int? idm_org { get; set; }

        public int? status { get; set; }

        public string phone_mob { get; set; }

        public string phone_vn { get; set; }

        public string phone_gor { get; set; }

        public string login_ad { get; set; }

        public string login_1c_t { get; set; }

        public string login_1c_id { get; set; }

        public string bolid_card_num { get; set; }

        public int? bolid_card_id { get; set; }

        public string email { get; set; }

        public string login_web { get; set; }

        public string web_pass_sha256 { get; set; }

        public int? idm_partner { get; set; }

        public int? view_only_otdel { get; set; }

        public int? view_only_self { get; set; }

        public byte? candidate { get; set; }

        public int? idm_controller { get; set; }

        public int? actual { get; set; }

        public int? idm_bolid { get; set; }

        public string photo_path { get; set; }

        public int? noFilial { get; set; }

        public int? realId { get; set; }

        public int? wt_self_depart { get; set; }

        public int? wt_hide { get; set; }

        public int? wt_check_fact_only { get; set; }

        public int? curator_dog { get; set; }

        public int? call_center_worker { get; set; }

        public int? IsLaborant { get; set; }

        public DateTime? date_cur { get; set; }

        public string user_cur { get; set; }

        public byte? del { get; set; }

        public string guid { get; set; }

        public string guid_web { get; set; }

        public string PinCode { get; set; }

        public DateTime? auth_mobile_last_date { get; set; }

        public string guid_iclinic { get; set; }

        public string password_email { get; set; }

        public int? sms_only { get; set; }

        public DateTime? date_dismissal { get; set; }

        public byte? NotSendApplication { get; set; }

        public DateTime? sertificate_date_expir { get; set; }

        public byte? ecp_status { get; set; }

        public DateTime? ecp_date_expir { get; set; }

        public DateTime? date_start_work { get; set; }

        public int? standing { get; set; }

        public int? idm_sert { get; set; }

        [NotMapped]
        public string Name
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
