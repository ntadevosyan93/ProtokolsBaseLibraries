using BaseLibraries.Common;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class PlacesEmail
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_place")]
        public int? idm_place { get; set; }

        [StringLength(150)]
        [ColumnMap("email")]
        public string email { get; set; }

        [StringLength(250)]
        [ColumnMap("info")]
        public string info { get; set; }

        [ColumnMap("type")]
        public PlaceEmailTypes type { get; set; }
    }
}
