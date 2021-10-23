using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Models.iClinic
{
    public class HospitalReferall
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("number")]
        public string number { get; set; }

        [ColumnMap("reason")]
        public string reason { get; set; }

        [ColumnMap("mkb_values")]
        public string mkb_values { get; set; }

        [ColumnMap("empl_position")]
        public string empl_position { get; set; }

        [ColumnMap("branch_manager")]
        public string branch_manager { get; set; }

        [ColumnMap("target_place")]
        public string target_place { get; set; }

        [ColumnMap("status")]
        public ReferalStatus status { get; set; }

        [ColumnMap("target")]
        public string target { get; set; }

        public IPatient Patient { get; set; }

        public IPatientInfo Info { get; set; }
    }

    
}
