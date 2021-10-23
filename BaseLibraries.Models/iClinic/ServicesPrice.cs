using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class ServicesPrice
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [ColumnMap("price")]
        public decimal? price { get; set; }

        [ColumnMap("idm_nomenkl")]
        public int? idm_nomenkl { get; set; }

        [ColumnMap("idm_parent")]
        public int? idm_parent { get; set; }

        [StringLength(10)]
        [ColumnMap("idm_1c_empl")]
        public string idm_1c_empl { get; set; }

        [ColumnMap("idm_empl")]
        public int? idm_empl { get; set; }

        [ColumnMap("is_group")]
        public int? is_group { get; set; }

        [StringLength(20)]
        [ColumnMap("idm_1c_parent")]
        public string idm_1c_parent { get; set; }
    }
}
