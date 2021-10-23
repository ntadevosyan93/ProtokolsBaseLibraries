using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class EmployeeProtocolRights
    {
        [Key]
        public int id { get; set; }

        [ColumnMap("user_cor")]
        public string user_cor { get; set; }

        [ColumnMap("date_cro")]
        public DateTime? date_cor { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("admin")]
        public bool admin { get; set; }

        [ColumnMap("edit_closed")]
        public bool edit_closed { get; set; }

        [ColumnMap("f25")]
        public bool f25 { get; set; }
        
    }
}
