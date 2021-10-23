using BaseLibraries.Abstractions.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.SMC
{
    /// <summary>
    /// Стандарт лечения
    /// </summary>
    [Table("List",Schema = "Standart")]
    public class Standart : IEntity
    {
        [Key]
        public int id { get; set; }

        /// <summary>
        /// Номер приказа
        /// </summary>
        [Column("order_num")]
        public string order_num { get; set; }

        /// <summary>
        /// Дата приказа
        /// </summary>
        [Column("order_date")]
        public DateTime? order_date { get; set; }

        /// <summary>
        /// Описание стандарта
        /// </summary>
        [Column("description")]
        public string description { get; set; }

        /// <summary>
        /// Класс болезни (группа по МКБ)
        /// </summary>
        [Column("mkb_group_code")]
        public string mkb_group_code { get; set; }

        /// <summary>
        /// Фаза
        /// </summary>
        [Column("phase")]
        public PhaseEnum phase { get; set; }

        /// <summary>
        /// Стадия
        /// </summary>
        [Column("stage")]
        public StageEnum stage { get; set; }

        /// <summary>
        /// Возрастная группа
        /// </summary>
        [Column("age_group")]
        public AgeGroupEnum age_group { get; set; }

        /// <summary>
        /// Условия оказания помощи
        /// </summary>
        [Column("terms_of_assistance")]
        public TermsOfAssistanceEnum terms_of_assistance { get; set; }

        [Column("is_actual")]
        public bool is_actual { get; set; }

        public override string ToString()
        {
            return "Приказ №." + order_num + " от " + order_date?.ToShortDateString();
        }

        public virtual List<PatientModel> PatientModels { get; set; }

        public Standart()
        {
            PatientModels = new List<PatientModel>();
        }

    }

    public enum PhaseEnum : byte
    {
        empty = 0,

    }
    public enum StageEnum : byte
    {
        empty = 0,
        First = 1,
        FirstWithResult = 2,
        Repeat = 3,
        WithThreatment = 4
    }
    public enum AgeGroupEnum : byte
    {
        empty = 0
    }
    public enum TermsOfAssistanceEnum : byte
    {
        empty = 0
    }

}
