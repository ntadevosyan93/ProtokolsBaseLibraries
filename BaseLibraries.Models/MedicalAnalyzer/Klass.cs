using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class Klass
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(klass_id))]
        public int klass_id { get; set; }

        [ColumnMap(nameof(klass_name))]
        public string klass_name { get; set; }

        [ColumnMap(nameof(klass_value_int))]
        public int? klass_value_int { get; set; }

        [ColumnMap(nameof(klass_value_str))]
        public string klass_value_str { get; set; }

        [ColumnMap(nameof(klass_value_datetime))]
        public DateTime? klass_value_datetime { get; set; }

        [ColumnMap(nameof(descript))]
        public string descript { get; set; }
    }
}
