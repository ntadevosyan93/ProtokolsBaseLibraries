using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class Tasks: ITaskBase
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [StringLength(9)]
        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [ColumnMap("idm_patient")]
        public int? idm_patient { get; set; }

        [ColumnMap("idm_employee")]
        public int? idm_employee { get; set; }

        [ColumnMap("idm_services")]
        public int? idm_services { get; set; }

        [ColumnMap("status")]
        public TaskStatus? status { get; set; }

        [ColumnMap("task_num_1c")]
        public int? task_num_1c { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [ColumnMap("blob")]
        public byte[] blob { get; set; }

        [ColumnMap("idm_1c_row")]
        public short? idm_1c_row { get; set; }

        [ColumnMap("idm_place")]
        public int? idm_place { get; set; }

        [ColumnMap("task_date_1c")]
        public DateTime? task_date_1c { get; set; }

        [ColumnMap("date_cor")]
        public DateTime? date_cor { get; set; }

        [StringLength(50)]
        [ColumnMap("guid")]
        public string guid { get; set; }

        [StringLength(50)]
        [ColumnMap("file_type")]
        public string file_type { get; set; }

        [ColumnMap("blob_external")]
        public byte[] blob_external { get; set; }

        [ColumnMap("comment")]
        public string comment { get; set; }

        [StringLength(50)]
        [ColumnMap("row_from")]
        public string row_from { get; set; }

        [StringLength(20)]
        [ColumnMap("dog_num")]
        public string dog_num { get; set; }

        [ColumnMap("dog_date")]
        public DateTime? dog_date { get; set; }

        [ColumnMap("diagnoz")]
        public string diagnoz { get; set; }

        [ColumnMap("sms_patient_marketing")]
        public YesNoEnum? sms_patient_marketing { get; set; }

        [ColumnMap("idm_employee_lab")]
        public int? idm_employee_lab { get; set; }

        [ColumnMap("price")]
        public decimal? price { get; set; }

        [ColumnMap("version")]
        public int? version { get; set; }

        [ColumnMap("escort")]
        public string escort { get; set; }

        [ColumnMap("repeat")]
        public DateTime? repeated_turnout { get; set; }

        [ColumnMap("type")]
        public TaskTypes type { get; set; }

        [ColumnMap("type")]
        public bool? tele { get { return _tele == null ? false:_tele; } set { _tele = value == null ? false : value; } }
        private bool? _tele;
    }
}
