using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.MaternityHospital;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;


namespace BaseLibraries.Models.MaternityHospital
{
    [Table("List", Schema = "Task")]
    public class Task : IEntity,IRemovable
    {
        [Key]
        public int id { get; set; }

        #region identifiers
        [Column("idm_patient")]
        public int? idm_patient { get; set; }

        [Column("idm_employee")]
        public int? idm_employee { get; set; }

        [Column("idm_service")]
        public int? idm_service { get; set; }

        [Column("idm_1c")]
        [StringLength(9)]
        public string idm_1c { get; set; }

        [Column("guid")]
        public Guid? guid { get; set; }

        [Column("dog_num")]
        [StringLength(20)]
        public string dog_num { get; set; }

        [Column("task_num")]
        [StringLength(20)]
        public string task_num { get; set; }
        #endregion

        #region period
        [Column("date_begin")]
        public DateTime? date_begin { get; set; }

        [Column("date_end")]
        public DateTime? date_end { get; set; }
        #endregion


        [Column("status")]
        public Common.MH.TaskStatus status { get; set; }

        [Column("room_num")]
        [DisplayName("Номер палаты")]
        [StringLength(4)]
        public string room_num { get; set; }

        [NotMapped()]
        [DisplayName("Возраст")]
        public int age {
            get {
                int value = 0;
                if(date_begin !=null && Employee?.date_b != null)
                {
                    value = ((date_begin - Employee.date_b).Value.Days) / 365;
                }
                return value;
            }
        }

        /// <summary>
        /// Кем направлена
        /// </summary>
        [Column("from_doctor")]
        [DisplayName("Кем направлена")]
        public string from_doctor { get; set; }


        /// <summary>
        /// Титр антител
        /// </summary>
        [Column("antibody_titer")]
        [DisplayName("Титр антител")]
        [StringLength(50)]
        public string antibody_titer { get; set; }

        /// <summary>
        /// Гемоглобин
        /// </summary>
        [Column("hemoglobin")]
        [DisplayName("Гемоглобин")]
        [StringLength(50)]
        public string hemoglobin { get; set; }


        /// <summary>
        /// Адрес постоянного места жительства
        /// </summary>
        [Column("address_live")]
        [DisplayName("Адрес постоянного места жительства")]
        public string address_live { get; set; }

        /// <summary>
        /// Семейное положение
        /// </summary>
        [Column("marital")]
        [DisplayName("Семейное положение")]
        public MeritalStatusMH marital { get; set; }

        /// <summary>
        /// Место работы, профессия, должность беременной, роженицы
        /// </summary>
        [Column("job_place")]
        [DisplayName("Место работы, профессия, должность беременной, роженицы")]
        public string job_place { get; set; }

        /// <summary>
        /// Посещала врача во время беременности
        /// </summary>
        [Column("visiting_doc_pregancy")]
        [DisplayName("Посещала врача во время беременности")]
        public bool visiting_doc_pregancy { get; set; }

        /// <summary>
        /// Диагноз при поступлении
        /// </summary>
        [Column("diag_delivery")]
        [DisplayName("Диагноз при поступлении")]
        public string diag_delivery { get; set; }

        /// <summary>
        /// Диагноз клинический
        /// </summary>
        [Column("diag_clinical")]
        [DisplayName("Диагноз клинический")]
        public string diag_clinical { get; set; }

        /// <summary>
        /// Диагноз заключительный
        /// </summary>
        [Column(nameof(diag_final))]
        [DisplayName("Диагноз заключительный")]
        public string diag_final { get; set; }

        /// <summary>
        /// Осложнения в родах,после родов
        /// </summary>
        [Column(nameof(birth_complications))]
        [DisplayName("Осложнения в родах,после родов")]
        public string birth_complications { get; set; }

        /// <summary>
        /// Выбыла
        /// </summary>
        [Column(nameof(dropped_out_result))]
        [DisplayName("Выбыла")]
        public BithDroppedOut dropped_out_result { get; set; }

        [Column(nameof(f096))]
        public string f096 { get; set; }

        [Column(nameof(del))]
        public bool del { get; set; }

        [ForeignKey("idm_employee")]
        public virtual Employee Employee { get; set; }

        [ForeignKey("idm_patient")]
        public virtual Patient Patient { get; set; }

        [ForeignKey("idm_service")]
        public virtual Services Services { get; set; }

        public virtual ObservableCollection<TaskPage> Pages { get; set; }

        public void SaveChange()
        {
            OnSave?.Invoke(this, EventArgs.Empty);
            OnChanged?.Invoke(null,EventArgs.Empty);
        }

        public void Close()
        {
            OnClose?.Invoke(this, EventArgs.Empty);
        }

        public event EventHandler OnSave = delegate { };
        public event EventHandler OnClose = delegate { };

        public event EventHandler OnChanged = delegate { };

        public Task()
        {
            Pages = new ObservableCollection<TaskPage>();
        }

    }
}
