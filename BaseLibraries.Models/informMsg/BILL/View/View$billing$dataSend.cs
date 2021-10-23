using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.informMsg.BILL.View
{
    [Table("dbo.View$billing$dataSend")]
    public class View_billing_dataSend
    {
        public int id { get; set; }
        public string number { get; set; }

        public DateTime? date_bill { get; set; }

        public string description { get; set; }

        public string partner { get; set; }

        public decimal? summ { get; set; }

        public int? idm_curator { get; set; }

        public string bill_guid { get; set; }

        public string status { get; set; }

        public int? idm_status { get; set; }
        public int? idm_isp { get; set; }
    }
}
