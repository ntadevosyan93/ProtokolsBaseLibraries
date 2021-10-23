using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{

    public interface IEditENTLASSUNGBatch: IId
    {
        DateTime? date_ext { get; set; }

        string Note { get; set; }
    }
    public interface IEditEntlassung: IEditENTLASSUNGBatch
    {
        int? idm_employee { get; set; }

        int? idm_dolj { get; set; }

        int? idm_otdel { get; set; }

        int? idm_org { get; set; }

        int? idm_chif { get; set; }
    }
}
