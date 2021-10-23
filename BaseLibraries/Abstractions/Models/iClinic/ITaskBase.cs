using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface ITaskBase
    {
        int id { get; set; }
        int? idm_employee { get; set; }
        int? idm_patient { get; set; }
        int? idm_services { get; set; }
        DateTime? date_in { get; set; }
        int? version { get; set; }
    }
}
