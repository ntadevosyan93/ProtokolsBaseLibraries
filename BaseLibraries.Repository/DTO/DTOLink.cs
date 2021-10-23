using BaseLibraries.Repository.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.DTO
{
    public class DTOLink
    {
        [ColumName("id")]
        public int id_link { get; set; }

        [ColumName("link")]
        public string link { get; set; }

        [ColumName("ip")]
        public string ip { get; set; }

        [ColumName("controller")]
        public string controller { get; set; }

        [ColumName("action")]
        public string action { get; set; }

        [ColumName("parameters")]
        public string parameters { get; set; }

        [ColumName("query")]
        public string query { get; set; }

        [ColumName("date_in")]
        public DateTime? date_in { get; set; }

        [ColumName("user_in")]
        public string user_in { get; set; }

    }
}
