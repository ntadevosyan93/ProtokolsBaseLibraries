using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class Protocols2Map : IEntity, IProtocols2Map
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_protocol2")]
        public int idm_protocol2 { get; set; }

        [ColumnMap("type")]
        public RtfBlockType type { get; set; }

        [ColumnMap("start")]
        public int start { get; set; }

        [ColumnMap("end")]
        public int end { get; set; }

        [ForeignKey("idm_protocol2")]
        public virtual Protocols2 Protocol2 { get; set; }
    }
}
