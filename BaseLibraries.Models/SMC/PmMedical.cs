using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.SMC
{
    [Table("Medical",Schema = "PatientModel")]
    public class PmMedical
    {
        [Key]
        public int id { get; set; }

        [Column("idm_pm")]
        public int idm_pm { get; set; }

        [Column("pharm_group")]
        public string pharm_group { get; set; }

        [Column("atx")]
        public string atx { get; set; }

        [Column("mnn")]
        public string mnn { get; set; }

        [Column("periodicity")]
        public string periodicity { get; set; }

        [Column("edd")]
        public string edd { get; set; }

        [Column("ecd")]
        public string ecd { get; set; }

        [ForeignKey("idm_pm")]
        public virtual PatientModel PatientModel { get; set; }
    }
}
