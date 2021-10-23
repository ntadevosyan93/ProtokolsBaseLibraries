using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IProtocols2Map
    {
        int idm_protocol2 { get; set; }
        RtfBlockType type { get; set; }
        int start { get; set; }
        int end { get; set; }
    }
}
