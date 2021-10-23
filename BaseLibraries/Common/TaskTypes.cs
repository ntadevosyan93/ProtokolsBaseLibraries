using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы приема врача
    /// </summary>
    public enum TaskTypes : byte
    {
        /// <summary>
        /// Не указано
        /// </summary>
        [Description("Н\\У")]
        NA = 0,

        /// <summary>
        /// Первичный прием
        /// </summary>
        [Description("Первичное")]
        First = 1,

        /// <summary>
        /// Повторный
        /// </summary>
        [Description("Повторное")]
        Repeat = 2
    }
}
