using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Common
{
    public enum SignalType : byte
    {
        ConnectionLose = 1,
        BrokenShema = 2,
        CastError = 3,
    }
}
