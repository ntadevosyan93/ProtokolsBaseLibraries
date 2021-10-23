using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.SMC
{
    public enum ServiceType : byte {
        NA = 0,
        Diagnostics = 1,
        Threatment = 2
    }

    [Table("Services",Schema = "PatientModel")]
    public class PmServices
    {
        [Key]
        public int id { get; set; }

        [Column("idm_pm")]
        public int idm_pm { get; set; }

        [Column("type")]
        public ServiceType type { get; set; }

        [Column("caption")]
        public string caption { get; set; }

        [Column("code")]
        public string code { get; set; }

        [Column("name")]
        public string name { get; set; }

        [Column("periodicity")]
        public string pariodicity { get; set; }

        [Column("average")]
        public string average { get; set; }

        [ForeignKey("idm_pm")]
        public virtual PatientModel PatientModel { get; set; }

    }
}
