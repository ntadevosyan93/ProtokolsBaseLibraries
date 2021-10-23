using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Как установлен (вперые/повтоный)
    /// </summary>
    public enum DiagnosisProof : byte
    {
        /// <summary>
        /// Не указано
        /// </summary>
        [Description("Не указано")]
        NA = 0,

        /// <summary>
        /// Острый и или установлен впервые
        /// </summary>
        [Description("Острый и/или установленный впервые")]
        IdentifiedFirst = 1,

        /// <summary>
        /// Хронический установлен повторно
        /// </summary>
        [Description("Хронический или установленный повторно")]
        ReIdentified = 2,
    }
}
