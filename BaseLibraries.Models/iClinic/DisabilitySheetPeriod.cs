using BaseLibraries.Abstractions.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class DisabilitySheetPeriod : IEntity, IPeriod
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_disability_sheet")]
        public int idm_disability_sheet { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("begin_date")]
        public DateTime begin_date { get; set; }

        [ColumnMap("end_date")]
        public DateTime? end_date { get; set; }
    }
}
