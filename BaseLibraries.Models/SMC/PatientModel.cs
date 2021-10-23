using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.SMC
{
    [Table("PatientModel",Schema = "Standart")]
    public class PatientModel
    {
        [Key]
        public int id { get; set; }

        [Column("idm_standart")]
        public int idm_standart { get; set; }

        [Column("age_category")]
        public string age_category { get; set; }

        [Column("nosology")]
        public string nosology { get; set; }

        [Column("mkb")]
        public string mkb { get; set; }

        [Column("phase")]
        public string phase { get; set; }

        [Column("complications")]
        public string complications { get; set; }

        [Column("terms_of_provision")]
        public string terms_of_provision { get; set; }

        [ForeignKey("idm_standart")]
        public virtual Standart Standart { get; set; }

        public virtual List<PmNosology> PmNosologies { get; set; }

        public virtual List<PmServices> PmServices { get; set; }

        public virtual List<PmMedical> PmMedicals { get; set; }

        public PatientModel()
        {
            PmNosologies = new List<PmNosology>();
            PmServices = new List<PmServices>();
            PmMedicals = new List<PmMedical>();


        }
    }
}
