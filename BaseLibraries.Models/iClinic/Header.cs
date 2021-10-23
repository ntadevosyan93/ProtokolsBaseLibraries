using BaseLibraries.Abstractions.Models.iClinic;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class Header : IHeader
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("text")]
        public string text { get; set; }

        [ColumnMap("blob")]
        public byte[] blob { get; set; }

        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [ColumnMap("head")]
        public string head { get; set; }
    }
}
