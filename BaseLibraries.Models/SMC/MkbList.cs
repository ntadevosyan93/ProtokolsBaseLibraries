using BaseLibraries.Abstractions.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.SMC
{
    /// <summary>
    /// Справочник МКБ10
    /// </summary>
    [Table("List", Schema = "Mkb")]
    public class Mkb : IEntity
    {
        [Key]
        public int id { get; set; }

        [Column("sort")]
        public string sort { get; set; }

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

        [Column("parent_id")]
        public int? parent_id { get; set; }

        [Column("date_cor")]
        public DateTime date_cor { get; set; }

        [Column("is_actual")]
        public bool is_actual { get; set; }

        [Column("is_oms")]
        public bool is_oms { get; set; }

        public override string ToString()
        {
            return code + " " + name;
        }
    }
}
