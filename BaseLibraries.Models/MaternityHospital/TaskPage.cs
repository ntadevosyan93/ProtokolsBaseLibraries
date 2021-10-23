using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.MaternityHospital;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MaternityHospital
{
    [Table("Page", Schema = "Task")]
    public class TaskPage : IRemovable, IEntity, ITaskPageView
    {
        [Key]
        public int id { get; set; }

        [Column("user_in")]
        public int user_in { get; set; }

        [Column("user_cor")]
        public int? user_cor { get; set; }

        [Column("idm_task")]
        public int? idm_task { get; set; }

        /// <summary>
        /// Дата записи
        /// </summary>
        [Column("date_in")]
        public DateTime date_in { get; set; }

        /// <summary>
        /// Дата корректировки
        /// </summary>
        [Column("date_cor")]
        public DateTime? date_cor { get; set; }

        /// <summary>
        /// Время
        /// </summary>
        [NotMapped]
        public string time { get { return date_in.ToShortTimeString(); } }

        /// <summary>
        /// Тип листа
        /// </summary>
        [Column("page_type")]
        public BirhtHistoryPageType page_type { get; set; }

        /// <summary>
        /// Общее состосяние
        /// </summary>
        [Column("patient_state")]
        public PatientGeneralState patient_state {get;set;}

        /// <summary>
        /// Заметки
        /// </summary>
        [Column("notes")]
        public string notes { get; set; }

        [Column("del")]
        public bool del { get; set; }

        /// <summary>
        /// Данные json для ui
        /// </summary>
        [Column("json")]
        public string json { get; set; }

        /// <summary>
        /// Бин для рич.
        /// </summary>
        [Column("rtf_content")]
        public string rtf_content { get; set; }


        [ForeignKey("idm_task")]
        public virtual Task Task { get; set; }
    }
}
