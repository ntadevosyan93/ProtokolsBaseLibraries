using BaseLibraries.Abstractions.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.SMC
{
    /// <summary>
    /// Справочник "Номенклатура медицинских услуг"
    /// </summary>
    [Table("List",Schema = "Services")]
    public class Services : IEntity
    {
        [Key]
        public int id { get; set; }

        /// <summary>
        /// Код
        /// </summary>
        [Column("code")]
        public string code { get; set; }

        /// <summary>
        /// Наименование
        /// </summary>
        [Column("name")]
        public string name { get; set; }

        /// <summary>
        /// Описание
        /// </summary>
        [Column("description")]
        public string description { get; set; }

        /// <summary>
        /// Признак актуальности
        /// </summary>
        [Column("is_actual")]
        public bool is_actual { get; set; }

        /// <summary>
        /// Дата деактуализации
        /// </summary>
        [Column("date_end")]
        public DateTime? date_end { get; set; }
    }
}
