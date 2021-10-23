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
    [Table("dbo.RM$OS$BILLING")]
    public class RM_OS_BILLING : IAccept, IBillOplata, IBilldate_pay_purpose, IBilling, IHistory
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public DateTime? date_bill { get; set; }

        public string number { get; set; }

        public int? idm_partner { get; set; }

        public int? idm_owner { get; set; }

        public int? idm_isp { get; set; }

        public int? idm_curator { get; set; }

        public string description { get; set; }

        public decimal? summ { get; set; }

        public decimal? summ_cy { get; set; }

        public int? summ_cy_type { get; set; }

        public double? cy_rate { get; set; }

        public double? percent_cy { get; set; }

        public decimal? nds { get; set; }

        public int? status { get; set; }

        public int? idm_billing { get; set; }

        public DateTime? date_paid { get; set; }

        public string nom_paid { get; set; }

        public int? send_assept { get; set; }

        public int? idm_department { get; set; }

        public string invoice_number { get; set; }

        public DateTime? invoice_date { get; set; }

        public int? idm_dogovor { get; set; }

        public int? bill_dogovor { get; set; }

        public int? type_pay { get; set; }

        public DateTime? date_pay { get; set; }

        public DateTime? date_pay_purpose { get; set; }

        public int? assept_number { get; set; }

        public DateTime? assept_date { get; set; }

        public int? assept_idm { get; set; }

        public int? idm_budgetGroup { get; set; }

        public int? idm_budget { get; set; }

        public int? send_agree { get; set; }

        public int? idm_file_store { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public int? del { get; set; }

        public string bill_guid { get; set; }

        public int? AllowAgreeMarceting { get; set; }

        public int? budget_depart { get; set; }
        public DateTime? budget_month { get; set; }

        public bool? pay_oms { get; set; }

        public bool? IsNewStatus { get; set; }
        public bool? IsNotDogovor { get; set; }
    }
}
