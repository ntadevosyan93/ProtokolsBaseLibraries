using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.DOGOVORS$REG")]
    public class DOGOVORS_REG
    {
            [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string guid { get; set; }

        public string user_in { get; set; }

        public string number_storage { get; set; }

        public DateTime? date_reg { get; set; }

        public int? set_numb_automat { get; set; }

        public string r_number { get; set; }

        public DateTime? r_date { get; set; }

        public int? idm_partner { get; set; }

        public int? idm_dog_type { get; set; }

        public string subject { get; set; }

        public string cost_no_nds { get; set; }

        public string cost_nds_value { get; set; }

        public string cost_summ { get; set; }

        public DateTime? r_date_deadline { get; set; }

        public int? idm_empl { get; set; }

        public string notes_conflicts { get; set; }

        public string notes_agreement { get; set; }

        public string notes { get; set; }

        public int? idm_owner { get; set; }

        public int? status { get; set; }

        public int? idm_template { get; set; }

        public string pay_rules { get; set; }

        public DateTime? date_deadline { get; set; }

        public int? some_status { get; set; }

        public int? curator_sended { get; set; }

        public int? idm_isp { get; set; }

        public int? isp_sended { get; set; }

        public int? old_dogovor { get; set; }

        public int? idm_parent { get; set; }

        public byte? del { get; set; }

        public string user_del { get; set; }

        public DateTime? date_del { get; set; }

        public string comment_clearNum { get; set; }

        public string user_clear { get; set; }

        public DateTime? date_clear { get; set; }

        public int? parent_dog { get; set; }

    }
}
