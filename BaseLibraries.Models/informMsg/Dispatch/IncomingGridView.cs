using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Dispatch
{
    [Table("dbo.IncomingGridView")]
    public class IncomingGridView
    {
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public DateTime? date_doc { get; set; }

        public int? number { get; set; }

        public string partner { get; set; }

        public string sotr { get; set; }

        public string empl { get; set; }

        public string type_dispatch_text { get; set; }
        public int? type_dispatch { get; set; }

        public string text { get; set; }

        public string reg_number_blank { get; set; }

        public string notes { get; set; }

        public int? idm_partner { get; set; }
        public int? idm_self { get; set; }
    }
}
