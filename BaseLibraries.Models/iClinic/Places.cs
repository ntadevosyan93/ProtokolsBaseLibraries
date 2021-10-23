using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System.ComponentModel.DataAnnotations;


namespace BaseLibraries.Models.iClinic
{
    public class Places : IPlace
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(50)]
        [ColumnMap("text")]
        public string text { get; set; }

        [ColumnMap("blob")]
        public byte[] blob { get; set; }

        [StringLength(9)]
        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(500)]
        [ColumnMap("head")]
        public string head { get; set; }

        [StringLength(50)]
        [ColumnMap("descr")]
        public string descr { get; set; }

        [StringLength(250)]
        [ColumnMap("printMedicalName")]
        public string printMedicalName { get; set; }

        [StringLength(250)]
        [ColumnMap("printOrganization")]
        public string printOrganization { get; set; }

        [StringLength(350)]
        [ColumnMap("printAdress")]
        public string printAdress { get; set; }

        [StringLength(50)]
        [ColumnMap("shortName")]
        public string shortName { get; set; }

        [StringLength(350)]
        [ColumnMap("filialAdress")]
        public string filialAdress { get; set; }

        [StringLength(350)]
        [ColumnMap("abbr")]
        public string abbr { get; set; }

        [StringLength(350)]
        [ColumnMap("blanktext")]
        public string blanktext { get; set; }

        [ColumnMap("del")]
        public int? del { get; set; }

        [StringLength(50)]
        [ColumnMap("email")]
        public string email { get; set; }

        [ColumnMap("mobile_on")]
        public YesNoEnum? mobile_on { get; set; }

        [ColumnMap("mobile_display_on")]
        public YesNoEnum? mobile_display_on { get; set; }

        [ColumnMap("mobile_filter_on")]
        public YesNoEnum? mobile_filter_on { get; set; }

        [StringLength(150)]
        [ColumnMap("mobile_name")]
        public string mobile_name { get; set; }

        [StringLength(150)]
        [ColumnMap("mobile_short_text")]
        public string mobile_short_text { get; set; }

        [StringLength(150)]
        [ColumnMap("mobile_address")]
        public string mobile_address { get; set; }

        [StringLength(150)]
        [ColumnMap("mobile_hours")]
        public string mobile_hours { get; set; }

        [StringLength(250)]
        [ColumnMap("mobile_link")]
        public string mobile_link { get; set; }

        [StringLength(250)]
        [ColumnMap("mobile_link_img")]
        public string mobile_link_img { get; set; }

        [ColumnMap("mobile_sort") ]
        public int? mobile_sort { get; set; }

        [StringLength(50)]
        [ColumnMap("guid")]
        public string guid { get; set; }

        [ColumnMap("inn")]
        public string inn { get; set; }

        [ColumnMap("legalAdress")]
        public string legalAdress { get; set; }

        [StringLength(350)]
        [ColumnMap("AdressProtocol")]
        public string AdressProtocol { get; set; }

        [StringLength(350)]
        [ColumnMap("OnkoAdress")]
        public string OnkoAdress { get; set; }

        [StringLength(350)]
        [ColumnMap("city")]
        public string city { get; set; }
    }
}
