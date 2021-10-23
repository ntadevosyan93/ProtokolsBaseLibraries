using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Models.iClinic
{
    public class GystoData
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_template")]
        public int idm_template { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("json")]
        public string json { get; set; }
    }
}
