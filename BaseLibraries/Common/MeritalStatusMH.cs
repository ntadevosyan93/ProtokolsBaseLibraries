using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum MeritalStatusMH : byte
    {
        /// <summary>
        /// Женат(замужем)
        /// </summary>
        [Description("Брак зарегистрирован")]
        Married = 1,

        /// <summary>
        /// Не женат(не замужем)
        /// </summary>
        [Description("Брак не зарегистрирован")]
        NoMarried = 2,

        /// <summary>
        /// Не женат(не замужем)
        /// </summary>
        [Description("Одинокая")]
        Alone = 3,

        /// <summary>
        /// Не известно
        /// </summary>
        [Description("Не известно")]
        Unknown = 4
    }
}
