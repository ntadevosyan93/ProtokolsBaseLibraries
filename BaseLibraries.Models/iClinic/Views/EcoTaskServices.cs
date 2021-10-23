using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Views
{
    public class EcoTasksServices
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_type")]
        public int? idm_type { get; set; }

        [ColumnMap("idm_services")]
        public int? idm_services { get; set; }

    }
}
