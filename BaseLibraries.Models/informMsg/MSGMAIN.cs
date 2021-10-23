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
    [Table("dbo.MSG$MAIN")]
    public class MSGMAIN : IMessage, ICreate
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public string ip_in { get; set; }

        public string text { get; set; }

        public string module { get; set; }

        public string db_name { get; set; }

        public string db_table { get; set; }

        public int? db_table_id { get; set; }

        public int? to_user { get; set; }

        public byte? del { get; set; }

        public DateTime? date_del { get; set; }

        public string user_del { get; set; }

        public string guid { get; set; }


    }
}
