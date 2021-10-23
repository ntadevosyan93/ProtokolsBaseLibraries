using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{

    public class Tasks
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime date_in { get; set; }

        [ColumnMap(nameof(task_1c_num))]
        public string task_1c_num { get; set; }

        [ColumnMap(nameof(task_1c_date))]
        public DateTime task_1c_date { get; set; }

        [ColumnMap(nameof(task_1c_id))]
        public string task_1c_id { get; set; }

        [ColumnMap(nameof(status))]
        public int status { get; set; }

        [ColumnMap(nameof(patient_sex))]
        public byte patient_sex { get; set; }

        [ColumnMap(nameof(patient_birthday))]
        public DateTime patient_birthday { get; set; }

        [ColumnMap(nameof(comment))]
        public string comment { get; set; }

        [ColumnMap(nameof(IsHandInput))]
        public int IsHandInput { get; set; }

        [ColumnMap(nameof(user_in))]
        public string user_in { get; set; }

        [ColumnMap(nameof(date_admission_lab))]
        public DateTime date_admission_lab { get; set; }

        [ColumnMap(nameof(idm_patient))]
        public int idm_patient { get; set; }

        [ColumnMap(nameof(pregnancy))]
        public short pregnancy { get; set; }

        [ColumnMap(nameof(menstrual_cycle_day))]
        public short menstrual_cycle_day { get; set; }
    }
}
