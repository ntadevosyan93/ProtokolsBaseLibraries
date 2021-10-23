using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class InsuranceOrg
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(50)]
        [ColumnMap("federal_area")]
        public string federal_area { get; set; }

        [StringLength(50)]
        [ColumnMap("federal_subjcet")]
        public string federal_subjcet { get; set; }

        [StringLength(200)]
        [ColumnMap("full_name")]
        public string full_name { get; set; }

        [StringLength(200)]
        [ColumnMap("short_name")]
        public string short_name { get; set; }

        [StringLength(5)]
        [ColumnMap("reg_number")]
        public string reg_number { get; set; }

        [StringLength(12)]
        [ColumnMap("inn")]
        public string inn { get; set; }

        [StringLength(15)]
        [ColumnMap("ogrn")]
        public string ogrn { get; set; }

        [StringLength(200)]
        [ColumnMap("address")]
        public string address { get; set; }

        [StringLength(250)]
        [ColumnMap("contacts")]
        public string contacts { get; set; }

    }
}
