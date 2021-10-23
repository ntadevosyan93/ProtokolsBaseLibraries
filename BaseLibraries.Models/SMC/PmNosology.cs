using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.SMC
{
    [Table("Nosology",Schema = "PatientModel")]
    public class PmNosology
    {
        [Key]
        public int id { get; set; }

        [Column("idm_pm")]
        public int idm_pm { get; set; }

        [Column("mkb_code")]
        public string mkb_code { get; set; }

        [ForeignKey("idm_pm")]
        public virtual PatientModel PatientModel { get; set; }
    }
}
