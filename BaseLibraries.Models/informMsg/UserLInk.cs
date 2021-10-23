
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BaseLibraries.Interfaces;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.UserLink")]
    public class UserLink : ICreate
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }


        public string link { get; set; }
        
        public string parameters { get; set; }

        public string controller { get; set; }

        public string action { get; set; }

        public string query { get; set; }

        public string ip { get; set; }

    }
}
