using BaseLibraries.Abstractions.Models.iClinic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class Mkb10_4 : IMkb10
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("sort")]
        public string sort { get; set; }

        [ColumnMap("code")]
        public string code { get; set; }

        [ColumnMap("name")]
        public string name { get; set; }

        [ColumnMap("parent_id")]
        public int? parent_id { get; set; }

        [NotMapped]
        public string full_name { get { return  code == "ZZZ"? "" : code + " " + name; } }

        public override string ToString()
        {
            return full_name;
        }
    }
}
