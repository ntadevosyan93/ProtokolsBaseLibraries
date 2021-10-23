using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models
{

        [Table("dbo.DEPARTMENTS")]
        public class DEPARTMENTS
        {
            [Key]
            public int id { get; set; }

            public string text { get; set; }

            public string address { get; set; }

            public short? idm_1c { get; set; }

            public DateTime? wt_date_lock { get; set; }

            public DateTime? date_cor { get; set; }

            public int? idm_iclinic_places { get; set; }
            [Column("dep_del")]
            public int? del { get; set; }

        }
    
}
