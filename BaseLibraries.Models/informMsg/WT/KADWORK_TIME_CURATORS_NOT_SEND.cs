using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.WT
{
    [Table("dbo.KAD$WORK_TIME_CURATORS_NOT_SEND")]
    public class KADWORK_TIME_CURATORS_NOT_SEND:ICreate
    {
        [Key]
        public int pk { get; set; }
    
        [NotMapped]
        public int id
        {
            get { return pk; }
            set { pk = value; }
        }

        public int idm_empl { get; set; }
    
        public DateTime? date_in { get; set; }
    
        public string user_in { get; set; }
    
        public bool? del { get; set; }

    }
}
