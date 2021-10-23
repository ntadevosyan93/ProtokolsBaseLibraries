using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common.Bill
{

    public enum TypeAgreeMarketing : byte
    {
        [Description("Добавить")]
        Add = 1,

        [Description("Убрать")]
        Del = 0

 
    }
}
