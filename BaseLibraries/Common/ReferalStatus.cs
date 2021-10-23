using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Common
{
    public enum ReferalStatus : short
    {
        /// <summary>
        /// Первичное оформление
        /// </summary>
        OnCreate = 1,

        /// <summary>
        /// В работе
        /// </summary>
        OnWork = 2,

        /// <summary>
        /// Обработано
        /// </summary>
        Complite = 3,

        /// <summary>
        /// Удалено
        /// </summary>
        Delete = 4
    }
}
