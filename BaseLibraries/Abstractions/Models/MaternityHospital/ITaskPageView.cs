using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.MaternityHospital
{
    public interface ITaskPageView: IEntity
    {
        int? idm_task { get; set; }
        DateTime date_in { get; set; }
        string notes { get; set; }
    }
}
