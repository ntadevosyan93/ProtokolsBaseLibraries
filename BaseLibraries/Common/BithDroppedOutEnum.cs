using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Выбыла из роддома 
    /// </summary>
    public enum BithDroppedOut : byte
    {
        /// <summary>
        /// выписана
        /// </summary>
        [Description("выписана")]
        Discharged = 0,

        /// <summary>
        /// переведена
        /// </summary>
        [Description("переведена")]
        Translated = 1,

        /// <summary>
        /// умерла беременной
        /// </summary>
        [Description("умерла беременной")]
        DiedPregnant = 2,

        /// <summary>
        /// умерла во время родов
        /// </summary>
        [Description("умерла во время родов")]
        DiedDuringChildbirth = 3,

        /// <summary>
        /// умерла после родов
        /// </summary>
        [Description("умерла после родов")]
        DiedAfterChildbirth = 4,

        /// <summary>
        /// Не указано
        /// </summary>
        [Description("не указано")]
        None = 255
    }
}
