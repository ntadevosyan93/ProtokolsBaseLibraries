using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class Protocols2Fields
    {
        [Key]
        public int id { get; set; }
        public int idm_protocol { get; set; }

        [StringLength(250)]
        public string name { get; set; }
        public string val { get; set; }

        [ForeignKey("idm_protocol")]
        public virtual Protocols2 Protocols2 { get; set; }

        public override string ToString()
        {
            return name;
        }

    }
}
