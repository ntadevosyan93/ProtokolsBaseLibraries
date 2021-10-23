using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Views
{
    public class PatientDiagnosesView
    {
        [ColumnMap("idm_diagnose")]
        public int idm_diagnose { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("spec_name")]
        public string spec_name { get; set; }

        [ColumnMap("fio")]
        public string fio { get; set; }

        [ColumnMap("type")]
        public DiagnosisTypes type { get; set; }

        [ColumnMap("proof_type")]
        public DiagnosisProof proof_type { get; set; }

        [ColumnMap("code")]
        public string code { get; set; }

        [ColumnMap("name")]
        public string name { get; set; }

        [ColumnMap("description")]
        public string description { get; set; }
    }
}
