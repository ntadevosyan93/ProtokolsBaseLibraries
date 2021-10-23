using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces.Bill
{
    public interface IRSMOSUpdate
    {

        string serial_num { get; set; }
        string inv_num { get; set; }
        string text { get; set; }
        int? idm_partner { get; set; }
        int? idm_type { get; set; }
        DateTime? doc_date_purchase { get; set; }
        string doc_num_purchase { get; set; }
        int? idm_otdel { get; set; }
        int? idm_head_org { get; set; }
        int? idm_billing { get; set; }
        int? idm_responsible { get; set; }
        /*int? idm_org { get; set; }

        int? idm_type { get; set; }

        int? idm_addr { get; set; }

        int? idm_mol { get; set; }

        string place { get; set; }

        string text { get; set; }

        DateTime? date_start { get; set; }

        string serial_num { get; set; }

        string inv_num { get; set; }

        DateTime? doc_date_purchase { get; set; }

        string doc_num_purchase { get; set; }

        DateTime? cash_date { get; set; }

        string cash_number { get; set; }

        DateTime? receip_date { get; set; }

        string receip_number { get; set; }

        int? idm_partner { get; set; }

        int? idm_invoice { get; set; }

        int? status { get; set; }

        int? idm_partner_service { get; set; }

        string inv_num_extended { get; set; }

        int? idm_head_org { get; set; }

        int? idm_otdel { get; set; }

        int? idm_responsible { get; set; }

        short? date_release { get; set; }

        DateTime? date_expired { get; set; }

        DateTime? date_check { get; set; }

        int? idm_priority { get; set; }

        int? idm_billing { get; set; }

        int? idm_depart_offices { get; set; }
        */

    }
}
