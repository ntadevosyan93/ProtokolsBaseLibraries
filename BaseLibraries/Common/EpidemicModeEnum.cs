using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Режим изоляции
    /// </summary>
    public enum EpidemicMode : byte
    {
        /// <summary>
        /// Соблюдал
        /// </summary>
        [Description("cоблюдал")]
        Complied = 0,

        /// <summary>
        /// Соблюдал частично
        /// </summary>
        [Description("cоблюдал частично")]
        PartiallyComplied = 1,

        /// <summary>
        /// Не соблюдал
        /// </summary>
        [Description("не соблюдал")]
        NotComplied = 2
    }
}
