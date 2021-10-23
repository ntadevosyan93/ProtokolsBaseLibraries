using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class ApplicationReport
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("host")]
        public string host { get; set; }

        [ColumnMap("application")]
        public string application { get; set; }

        [ColumnMap("deploy_version")]
        public string depoly_version { get; set; }

        [ColumnMap("name")]
        public string name { get; set; }

        [ColumnMap("data")]
        public string data { get; set; }
    }
}
