using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.Interfaces;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.RM$OS$BILLING_INVOICE")]
    public class RM_OS_BILLING_INVOICE: IInvoice, ICreate
    {

        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public int? idm_billing { get; set; }

        public string invoice_number { get; set; }

        public DateTime? invoice_date { get; set; }

        public string user_cur { get; set; }

        public int? idm_partner { get; set; }

        public int? idm_type { get; set; }

        public int? del { get; set; }
    }
}
