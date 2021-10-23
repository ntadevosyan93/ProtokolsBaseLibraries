using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IBillKey
    {
        int id { get; set; }
    }

    public interface IAccept: IBillKey
    {


        int? assept_number { get; set; }

        DateTime? assept_date { get; set; }

        int? assept_idm { get; set; }
    }
    public interface IStatus: IBillKey
    {
        int? status { get; set; }
    }
    public interface IBillOplata : IStatus, IBillKey
    {
        DateTime? date_paid { get; set; }
        string nom_paid { get; set; }

    }
    public interface IBilldate_pay_purpose : IStatus, IBillKey
    {
        DateTime? date_pay_purpose { get; set; }

    }
    
    public interface IBilling : IBillKey, IHistory
    {
   

        DateTime? date_bill { get; set; }

        string number { get; set; }

        int? idm_partner { get; set; }

        int? idm_owner { get; set; }

        int? idm_isp { get; set; }

        int? idm_curator { get; set; }

        string description { get; set; }

        decimal? summ { get; set; }

        decimal? summ_cy { get; set; }

        int? summ_cy_type { get; set; }

        double? cy_rate { get; set; }

        double? percent_cy { get; set; }

        decimal? nds { get; set; }

        int? status { get; set; }

        int? idm_billing { get; set; }

        DateTime? date_paid { get; set; }

        string nom_paid { get; set; }

        int? send_assept { get; set; }

        int? idm_department { get; set; }

        string invoice_number { get; set; }

        DateTime? invoice_date { get; set; }

        int? idm_dogovor { get; set; }

        int? bill_dogovor { get; set; }

        int? type_pay { get; set; }

        DateTime? date_pay { get; set; }

        DateTime? date_pay_purpose { get; set; }

        int? assept_number { get; set; }

        DateTime? assept_date { get; set; }

        int? assept_idm { get; set; }

        int? idm_budgetGroup { get; set; }

        int? idm_budget { get; set; }

        int? send_agree { get; set; }

        string bill_guid { get; set; }

        int? AllowAgreeMarceting { get; set; }

        int? budget_depart { get; set; }
        DateTime? budget_month { get; set; }

        bool? pay_oms { get; set; }

        bool? IsNewStatus { get; set; }

        bool? IsNotDogovor { get; set; }
    }
}
