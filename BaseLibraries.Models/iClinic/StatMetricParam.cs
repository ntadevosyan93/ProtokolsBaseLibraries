using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class StatMetricParam
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("metric")]
        public string metric { get; set; }

        [ColumnMap("idm_service")]
        public int? idm_service { get; set; }

        [ColumnMap("idm_eployee")]
        public int? idm_eployee { get; set; }

        [ColumnMap("type")]
        public byte? type { get; set; }
    }
}
