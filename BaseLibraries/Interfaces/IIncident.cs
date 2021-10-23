using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IIncident
    {
        int id { get; set; }

        string user_in { get; set; }

        DateTime? date_in { get; set; }

        int? idm_departments { get; set; }

        string text_problem { get; set; } 

        DateTime? date_start { get; set; }

        DateTime? date_stop { get; set; }

        string text_solution { get; set; }

        int? idm_empl { get; set; }

        int? status { get; set; }

        string guid { get; set; }
    }
}
