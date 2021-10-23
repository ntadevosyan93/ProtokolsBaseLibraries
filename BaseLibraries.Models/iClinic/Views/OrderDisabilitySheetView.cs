using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Views
{
    public class OrderDisabilitySheetView
    {
        /// <summary>
        /// Дата
        /// </summary>
        public DateTime date_begin { get; set; }

        /// <summary>
        /// Номер мед.карты
        /// </summary>
        public string number { get; set; }

        /// <summary>
        /// МКБ10
        /// </summary>
        public string diag_mkb { get; set; }

        /// <summary>
        /// ФИО пациента
        /// </summary>
        public string patient_fio { get; set; }

        /// <summary>
        /// Возраст пациента
        /// </summary>
        public int age { get; set; }

        /// <summary>
        /// Дата рождения
        /// </summary>
        public DateTime date_birth { get; set; }

        /// <summary>
        /// Место работы
        /// </summary>
        public string job_place { get; set; }

        /// <summary>
        /// Должность
        /// </summary>
        public string position { get; set; }

        /// <summary>
        /// основное место работы\совместитель
        /// </summary>
        public bool is_base_job { get; set; }

        /// <summary>
        /// Контактный телефон
        /// </summary>
        public string patient_phone { get; set; }


    }

   
}
