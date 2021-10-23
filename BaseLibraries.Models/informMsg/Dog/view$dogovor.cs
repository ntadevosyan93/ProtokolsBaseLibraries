using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Dog
{
    [Table("dbo.view$dogovor")]
    public class view_dogovor
    {
        public string subject { get; set; }

        public DateTime? date_reg { get; set; }

        public DateTime? r_date_deadline { get; set; }

        public string r_number { get; set; }

        public string subject_txt { get; set; }

        public string doc_guid { get; set; }

        public string some_status { get; set; }
        [Key]
        public int doc_id { get; set; }

        public int? idm_partner { get; set; }

        public int? idm_owner { get; set; }
        public int? idm_status { get; set; }
    }
}
