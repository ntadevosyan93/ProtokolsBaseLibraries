using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models
{
    [Table("dbo.PARTNER")]
    public class PARTNER
    {
        [Key]
        public int id { get; set; }

        public string text { get; set; }

        public int? type { get; set; }

        public int? owner { get; set; }

        public string u_adress { get; set; }

        public string f_adress { get; set; }

        public string inn { get; set; }

        public string kpp { get; set; }

        public string ogrn { get; set; }

        public string okpo { get; set; }

        public string head_doljn { get; set; }

        public string head_fio { get; set; }

        public DateTime? date_in { get; set; }

        public string type_in { get; set; }

    }
}
