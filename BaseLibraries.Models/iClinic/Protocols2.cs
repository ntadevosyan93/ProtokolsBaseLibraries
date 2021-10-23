using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class Protocols2
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_services")]
        public int? idm_services { get; set; }

        [StringLength(100)]
        public string text { get; set; }

        [ColumnMap("blob")]
        public byte[] blob { get; set; }

        [ColumnMap("def")]
        public byte? def { get; set; }

        [ColumnMap("idm_empl")]
        public int? idm_empl { get; set; }

        [ColumnMap("version")]
        public byte version { get; set; }

        [ColumnMap("json")]
        public string json { get; set; }

        [ForeignKey("idm_services")]
        public virtual Services Service { get; set; }

        [ForeignKey("idm_empl")]
        public virtual Employee Employee { get; set; }

        public virtual ICollection<Protocols2Fields> Fields { get; set; }

        public virtual ICollection<Protocols2Map> Maps { get; set; }

        public Protocols2()
        {
            Fields = new HashSet<Protocols2Fields>();
            Maps = new HashSet<Protocols2Map>();
        }

        public override string ToString()
        {
            string value = string.Empty;
            if (Service != null)
                value += Service.text;
            if (Employee != null)
                value += string.IsNullOrEmpty(value) ? Employee.fio : " " + Employee.fio;

            if (string.IsNullOrEmpty(value))
                return base.ToString();
            else
                return value;
        }
    }
}
