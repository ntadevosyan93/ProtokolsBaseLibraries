using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace BaseLibraries.Models.iClinic.Views
{
    public class PatientVisitsView
    {
        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("root_id")]
        public RootServiceType root_id { get; set; }

        [ColumnMap("num")]
        public int num { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("fio")]
        public string fio { get; set; }

        [ColumnMap("spec_name")]
        public string spec_name { get; set; }

        [ColumnMap("service_name")]
        public string service_name { get; set; }

        [ColumnMap("status")]
        public TaskStatus status { get; set; }
    }
}
