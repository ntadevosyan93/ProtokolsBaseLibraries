using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class PatientInfo : IPatientInfo
    {
        [Key,ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("user_in")]
        public int user_in { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("user_cor")]
        public int? user_cor { get; set; }

        [ColumnMap("date_cor")]
        public DateTime? date_cor { get; set; }

        /// <summary>
        /// Код категории льгот (категория, документ, серия и номер)
        /// </summary>
        [StringLength(3)]
        [ColumnMap("benefits_category")]
        public string benefits_category { get; set; }


        /// <summary>
        /// Серия полиса ОМС
        /// </summary>
        [StringLength(50)]
        [ColumnMap("oms_police")]
        public string oms_police { get; set; }


        /// <summary>
        /// СНИЛС
        /// </summary>
        [StringLength(14)]
        [ColumnMap("snils")]
        public string snils { get; set; }

        /// <summary>
        /// Наименование страховой организации
        /// </summary>
        [StringLength(250)]
        [ColumnMap("insurance_org")]
        public string insurance_org { get; set; }


        /// <summary>
        /// Семейные отношения
        /// </summary>
        [ColumnMap("marital_status")]
        public MaritalStatus marital_status { get; set; }

        /// <summary>
        /// Образование
        /// </summary>
        [ColumnMap("education")]
        public Education education { get; set; }

        /// <summary>
        /// Занятость
        /// </summary>
        [ColumnMap("employment")]
        public Employment employment { get; set; }

        /// <summary>
        /// Инвалидность (первичная, повторная, группа, дата)
        /// </summary>
        [ColumnMap("disability")]
        public string disability { get; set; }

        /// <summary>
        /// Место работы
        /// </summary>
        [ColumnMap("job_place")]
        public string job_place { get; set; }

        /// <summary>
        /// Основное место работы, совместитель
        /// </summary>
        [ColumnMap("is_main_job")]
        public bool is_main_job { get; set; }

        /// <summary>
        /// Должность
        /// </summary>
        [ColumnMap("position")]
        public string position { get; set; }

        /// <summary>
        /// Контактный телефон
        /// </summary>
        [ColumnMap("contact_phone")]
        public string contact_phone { get; set; }

        /// <summary>
        /// Группа крови
        /// </summary>
        [ColumnMap("blood_type")]
        public BloodType blood_type { get; set; }

        /// <summary>
        /// Rh - фактор
        /// </summary>
        [ColumnMap("rh_factor")]
        public string rh_factor { get; set; }

        /// <summary>
        /// Аллергические реакции
        /// </summary>
        [ColumnMap("allergic_reactions")]
        public string allergic_reactions { get; set; }

        /// <summary>
        /// Анамнез жизни
        /// </summary>
        [ColumnMap("anamnesis_life")]
        public string anamnesis_life { get; set; }

        /// <summary>
        /// Заметки по пациенту
        /// </summary>
        [ColumnMap("notes")]
        public string notes { get; set; }
       
    }
}
