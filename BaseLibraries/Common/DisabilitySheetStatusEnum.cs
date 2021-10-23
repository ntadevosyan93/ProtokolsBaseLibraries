using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum DisabilitySheetStatusEnum : byte
    {
        Created = 0,
        Progress = 1,
        Prolongation = 2,
        Commission = 3,
        Close = 4,
    }
}
