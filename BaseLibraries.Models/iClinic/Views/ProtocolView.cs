using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic.Views
{
    [Serializable]
    public class ProtocolView : IProtocolView
    {
        [Display(AutoGenerateField = false, Order = -1)]
        [ColumnMap("t_id")]
        [Column("t_id")]
        public int idm_task { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_idm_place")]
        [Column("t_idm_place")]
        public int idm_place { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_idm_patient")]
        [Column("t_idm_patient")]
        public int idm_patient { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_idm_employee")]
        [Column("t_idm_employee")]
        public int idm_employee { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_idm_services")]
        [Column("t_idm_services")]
        public int idm_services { get; set; }

        //new Added 
        [Display(AutoGenerateField = false)]
        [ColumnMap("p_text")]
        [Column("p_text")]
        public string p_text { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_status")]
        [Column("t_status")]
        public TaskStatus status { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_date_in")]
        [Column("t_date_in")]
        public DateTime date_in { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_date_cor")]
        [Column("t_date_cor")]
        public DateTime? date_cor { get; set; }


        [Display(AutoGenerateField = false)]
        [ColumnMap("dog_num")]
        [Column("dog_num")]
        public string dog_num { get; set; }

        [Display(Name = "№ Медкарты")]
        [ReadOnly(true)]
        [ColumnMap("t_task_num_1c")]
        [Column("t_task_num_1c")]
        public int task_num_1c { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("t_idm_1c_row")]
        [Column("t_idm_1c_row")]
        public short idm_1c_row { get; set; }

        [Display(Name = "Дата")]
        [ColumnMap("t_task_date_1c")]
        [Column("t_task_date_1c")]
        public DateTime task_date_1c { get; set; }

        [Display(Name = "ФИО врача")]
        [ColumnMap("e_fio")]
        [Column("e_fio")]
        public string employee_fio { get; set; }

        [Display(Name = "Категория врача")]
        [ColumnMap("e_cat")]
        [Column("e_cat")]
        public string employee_cat { get; set; }

        [Display(Name = "Степеь")]
        [ColumnMap("e_academ")]
        [Column("e_academ")]
        public string employee_academ { get; set; }

        [Display(Name = "Специальность")]
        [ColumnMap("spec_text")]
        [Column("spec_text")]
        public string spec_text { get; set; }

        [Display(Name = "ФИО пациента")]
        [ColumnMap("pat_fio")]
        [Column("pat_fio")]
        public string pat_fio { get; set; }

        [Display(Name = "пол")]
        [ColumnMap("gender")]
        [Column("gender")]
        public string pat_gender { get; set; }

        [Display(Name = "Дата рождения пациента")]
        [ColumnMap("pat_date_b")]
        [Column("pat_date_b")]
        public DateTime pat_date_b { get; set; }

        [Display(Name = "Возраст пациента")]
        [ColumnMap("pat_age")]
        [Column("pat_age")]
        public byte pat_age { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("s_showFooter")]
        [Column("s_showFooter")]
        public int? s_showFooter { get; set; }

        [Display(AutoGenerateField = false)]
        [ColumnMap("s_text")]
        [Column("s_text")]
        public string s_text { get; set; } = "";

        [Display(AutoGenerateField = false)]
        [ColumnMap("version")]
        [Column("version")]
        public int? version { get; set; }

        [Display(AutoGenerateField = false)]
        [Column("escort")]
        [ColumnMap("escort")]
        public string escort { get; set; }

        [Display(AutoGenerateField = false)]
        [Column("type")]
        [ColumnMap("type")]
        public TaskTypes type { get; set; }


        [Display(AutoGenerateField = false)]
        [Column("tele")]
        [ColumnMap("tele")]
        public bool? tele { get { return _tele == null ? false : _tele; } set { _tele = value == null ? false : value; } }
        private bool? _tele;

        [NotMapped]
        public bool unlocked { get; private set; }

        public void Unlock()
        {
            unlocked = true;
        }
    }
}

