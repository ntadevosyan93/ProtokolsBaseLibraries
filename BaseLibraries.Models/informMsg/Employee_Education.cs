using BaseLibraries.Interfaces;

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.Employee_Education")]
    public class Employee_Education:ICreate
    {
        [Key]
        public int id { get; set; }

        public int idm_employee { get; set; }

        public string dolj { get; set; }

        public int? idm_dolj { get; set; }

        public string skill_education { get; set; }

        public string additional_education { get; set; }

        public int? sert_spec { get; set; }

        public DateTime? sert_date { get; set; }

        public int? kategorie { get; set; }

        public DateTime? kategorie_date { get; set; }

        public int? standing { get; set; }

        public int? class_education { get; set; }

        public string nagrady { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public bool? del { get; set; }

    }
}
