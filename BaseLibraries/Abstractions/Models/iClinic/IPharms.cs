using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IPharm
    {
        int? order_id { get; set; }

        string pharm_name { get; set; }
        
        string pharm_intake_schedule { get; set; }

        string medical_dosage { get; set; }
        
        bool is_cancel { get; set; }
        
        string cancel_reason { get; set; }

    }
}
