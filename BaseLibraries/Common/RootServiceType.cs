using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum RootServiceType
    {
        [Description("Лабораторная")]
        Lab = 1124,

        [Description("Инструментальная")]
        Inst = 1126,

        [Description("Консультация")]
        Consult = 1125,
    }
}
