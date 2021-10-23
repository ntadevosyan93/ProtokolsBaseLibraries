using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.FILE_STOR")]
    public class InformFILE_STOR:ICreate
    {
        [Key]
        public int id { get; set; }

        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        public string ip_in { get; set; }

        public string file_path { get; set; }

        public string file_name { get; set; }

        public string file_guid { get; set; }

        public string module { get; set; }

        public string db_name { get; set; }

        public string db_table { get; set; }

        public int? db_table_id { get; set; }

        public string db_table_guid { get; set; }

        public byte? del { get; set; }

        public DateTime? date_del { get; set; }

        public string user_del { get; set; }

        public string ip_del { get; set; }

        public string description { get; set; }

        public string guid { get; set; }

        public string comment_del { get; set; }

        [NotMapped]
        public string FileServer
        {
            get
            {
                return guid.ToString() + System.IO.Path.GetExtension(file_name);
            }
        }
    }
}
