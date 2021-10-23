using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class EmergencyNotification : IEntity
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee{ get; set; }

        [ColumnMap("idm_mkb10")]
        public int idm_mkb10 { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("type")]
        public EmergencyTypesEnum type { get; set; }


        /// <summary>
        /// Рег. номер исх.
        /// </summary>
        [ColumnMap("reg_num")]
        public string reg_num { get; set; }

        /// <summary>
        /// Рег. номер в СЭС
        /// </summary>
        [ColumnMap("reg_num_ses")]
        public string reg_num_ses { get; set; }


        /// <summary>
        /// Дата и время первичной сигнализации в СЭС
        /// </summary>
        [ColumnMap("date_primary_alarm")]
        public DateTime? date_primary_alarm { get; set; }

        /// <summary>
        /// Дата и время отправки экстренного извещения
        /// </summary>
        public DateTime? date_sending { get; set; }

        /// <summary>
        /// Кто сообщил
        /// </summary>
        [ColumnMap("who_reported")]
        public string who_reported { get; set; }

        /// <summary>
        /// Кто принял
        /// </summary>
        [ColumnMap("received")]
        public string who_received { get; set; }
    }
}
