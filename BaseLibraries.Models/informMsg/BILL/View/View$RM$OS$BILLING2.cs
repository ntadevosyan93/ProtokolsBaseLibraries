using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.View$RM$OS$BILLING2")]
    public class View_RM_OS_BILLING2
    {
        public int? reas_ur { get; set; }

        public int? reas_m { get; set; }

        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public DateTime? date_bill { get; set; }

        public string number { get; set; }

        public string partner { get; set; }

        public string owner { get; set; }

        public string curator { get; set; }

        public string description { get; set; }

        public decimal? summ { get; set; }

        public decimal? summ_cy { get; set; }

        public int? summ_cy_type { get; set; }

        public double? cy_rate { get; set; }

        public double? percent_cy { get; set; }

        public decimal? nds { get; set; }

        public int? status { get; set; }

        public DateTime? date_paid { get; set; }

        public string nom_paid { get; set; }

        public int? send_assept { get; set; }

        public string department { get; set; }

        public string invoice_number { get; set; }

        public DateTime? invoice_date { get; set; }

        public int? bill_dogovor { get; set; }

        public int? type_pay { get; set; }

        public DateTime? date_pay { get; set; }

        public DateTime? date_pay_purpose { get; set; }

        public int? assept_number { get; set; }

        public int? assept_idm { get; set; }

        public int? idm_budget { get; set; }

        public int? send_agree { get; set; }

        public int? idm_file_store { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public int? del { get; set; }

        public string bill_guid { get; set; }

        public string klass_value { get; set; }

        public string comment_ur { get; set; }

        public string comment_m { get; set; }

        public int AllowPurpose { get; set; }

        public int? idm_partner { get; set; }

        public int? idm_owner { get; set; }

        public int? idm_isp { get; set; }

        public int? idm_curator { get; set; }

        public int? idm_department { get; set; }

        public int? idm_dogovor { get; set; }

        public int? idm_budgetGroup { get; set; }

        public DateTime? assept_date { get; set; }

        public int? AllowAgreeMarceting { get; set; }

    }
}
