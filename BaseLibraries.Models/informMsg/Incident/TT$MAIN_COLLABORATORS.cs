using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.TT$MAIN_COLLABORATORS")]
    public class TT_MAIN_COLLABORATORS: IHistory, ICOLLABORATORS
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public DateTime? date_cur { get; set; }

        public string user_cur { get; set; }

        public int? idm_empl { get; set; }

        [NotMapped]
        public int? idm_isp_coll
        {
            get { return idm_empl; }
            set { idm_empl = value; }
        }

        //public int? idm_COLLABORATOR { get; set; }

        public int? idm_main { get; set; }

        public int? del { get; set; }
    }
}
