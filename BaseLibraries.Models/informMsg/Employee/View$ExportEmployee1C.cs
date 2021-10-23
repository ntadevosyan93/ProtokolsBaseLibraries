
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BaseLibraries.Interfaces;

namespace BaseLibraries.Models.informMsg.Employee
{
    [Table("dbo.View$ExportEmployee1C")]
    public class View_ExportEmployee1C 
    {
        public string doljn { get; set; }

        public int id { get; set; }

        public string fam { get; set; }

        public string name { get; set; }

        public string otch { get; set; }

        public DateTime? data_b { get; set; }

        public string fio { get; set; }

        public string empl_guid { get; set; }
    }
}
