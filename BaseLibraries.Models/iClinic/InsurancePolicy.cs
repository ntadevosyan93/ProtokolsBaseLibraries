using BaseLibraries.Common;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class InsurancePolicy
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_org")]
        public int idm_org { get; set; }

        [ColumnMap("type")]
        public PolicyType type { get; set; }

        [StringLength(6)]
        [ColumnMap("series")]
        public string series { get; set; }

        [StringLength(14)]
        [ColumnMap("number")]
        public string number { get; set; }

    }
}
