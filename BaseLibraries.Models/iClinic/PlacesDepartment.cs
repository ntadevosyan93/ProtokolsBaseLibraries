using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class PlacesDepartment
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(150)]
        [ColumnMap("text")]
        public string text { get; set; }

    }
}
