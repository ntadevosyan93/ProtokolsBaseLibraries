using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IServiceView
    {
        
        int idm_service { get; set; }
        int? idm_root { get; set; }
        string text { get; set; }
    }
}
