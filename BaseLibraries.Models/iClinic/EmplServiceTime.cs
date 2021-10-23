using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class EmplServiceTime
    {
        [Key,ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_service")]
        public int idm_service { get; set; }

        [ColumnMap("time")]
        public int time { get; set; }
    }
}
