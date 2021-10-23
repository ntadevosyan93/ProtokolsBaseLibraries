using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Резус фактор
    /// </summary>
    public enum RhFactor : byte
    {
        [Description("+")]
        Positive = 0,

        [Description("-")]
        Negative = 1,

        [Description("н\\у")]
        Unknown = 255
    }
}
