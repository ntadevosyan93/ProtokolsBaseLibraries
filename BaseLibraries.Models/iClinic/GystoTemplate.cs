using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Models.iClinic
{
    public class GystoTemplate
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("title")]
        public string title { get; set; }

        [ColumnMap("name")]
        public string name { get; set; }

        [ColumnMap("footer")]
        public string footer { get; set; }

        [ColumnMap("json")]
        public string json { get; set; }

    }
}
