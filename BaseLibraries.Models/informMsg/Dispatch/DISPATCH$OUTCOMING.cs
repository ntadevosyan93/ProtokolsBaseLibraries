using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Dispatch
{
    [Table("dbo.DISPATCH$OUTCOMING")]
    public class DISPATCH_OUTCOMING:ICreate
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public int? number { get; set; }

        public DateTime? date_doc { get; set; }

        public int? idm_partner { get; set; }
        public string org_text { get; set; }
        public string idm_partner_text { get; set; }

        public string idm_partner_doc_number { get; set; }

        public DateTime? idm_partner_doc_date { get; set; }

        public string text { get; set; }

        public string resolution { get; set; }

        public int? idm_empl { get; set; }

        public DateTime? idm_empl_date_accept { get; set; }

        public DateTime? date_deadline { get; set; }

        public string notes { get; set; }

        public int? idm_depart { get; set; }

        public int? del { get; set; }

    }
}
