using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class PatientInsurance
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("idm_insurance")]
        public int idm_insurance { get; set; }

        [ColumnMap("user_in")]
        public int user_in { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }


    }
}
