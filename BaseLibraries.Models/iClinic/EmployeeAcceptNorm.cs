using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class EmployeeAcceptNorm
    {
        [Key]
        public int id { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("doc_name")]
        public string doc_name { get; set; }

        [ColumnMap("doc_date")]
        public DateTime doc_date { get; set; }

        [ColumnMap("read_date")]
        public DateTime read_date { get; set; }
    }
}
