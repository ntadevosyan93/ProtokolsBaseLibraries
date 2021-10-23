using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{

    public class Services : IService , IEntity
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(9)]
        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(250)]
        [ColumnMap("text")]
        public string text { get; set; }

        [StringLength(9)]
        [ColumnMap("idm_1c_parent")]
        public string idm_1c_parent { get; set; }

        [ColumnMap("id_parent")]
        public int? id_parent { get; set; }

        [ColumnMap("is_group")]
        public YesNoEnum? is_group { get; set; }

        [ColumnMap("from_eco")]
        public int? from_eco { get; set; }

        [ColumnMap("time_count")]
        public int? time_count { get; set; }

        [ColumnMap("time_sum")]
        public int? time_summ { get; set; }

        [ColumnMap("text_short")]
        public string text_short { get; set; }

        [ColumnMap("comment")]
        public string comment { get; set; }

        [ColumnMap("priem_len")]
        public int? priem_len { get; set; }

        [ColumnMap("dont_use")]
        public int? dont_use { get; set; }

        [ColumnMap("dont_web")]
        public int? dont_web { get; set; }

        [ColumnMap("descr")]
        public string descr { get; set; }

        [ColumnMap("ShowFooter")]
        public int? ShowFooter { get; set; }

        [ColumnMap("idm_spec")]
        public int? idm_spec { get; set; }

        [StringLength(20)]
        [ColumnMap("idm_1c_sepc")]
        public string idm_1c_spec { get; set; }

        [ColumnMap("not_show_list")]
        public YesNoEnum? not_show_list { get; set; }

        [StringLength(5)]
        [NotMapped]
        public string Code { get; set; }

        public override string ToString()
        {
            return text;
        }

    }
}
