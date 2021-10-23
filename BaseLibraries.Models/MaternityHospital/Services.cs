using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.MaternityHospital
{
    [Table("List", Schema = "Services")]
    public class Services : IEntity,IService
    {
        [Key]
        [Column("id")]
        public int id { get; set; }

        [Column("id_parent")]
        public int? id_parent { get; set; }

        [Column("idm_spec")]
        public int? idm_spec { get; set; }

        [Column("guid")]
        public string guid { get; set; }

        [StringLength(20)]
        [Column("idm_1c_spec")]
        public string idm_1c_spec { get; set; }

        [StringLength(9)]
        [Column("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(9)]
        [Column("idm_1c_parent")]
        public string idm_1c_parent { get; set; }

        [StringLength(250)]
        [Column("text")]
        [DisplayName("Наименование")]
        public string text { get; set; }

        [Column("text_short")]
        public string text_short { get; set; }

        [Column("comment")]
        public string comment { get; set; }

        [Column("descr")]
        public string descr { get; set; }

        [StringLength(5)]
        [NotMapped]
        public string Code { get; set; }

        public override string ToString()
        {
            return text;
        }


    }
}
