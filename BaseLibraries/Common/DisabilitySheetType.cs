using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum DisabilitySheetType : byte
    {
        [Description("Бумажный")]
        Paper = 1,

        [Description("Электронный")]
        Electr = 2
    }
}
