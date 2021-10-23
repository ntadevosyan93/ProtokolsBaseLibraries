using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы родственных связей
    /// </summary>
    public enum FamilyRelationshipEnum : byte
    {
        /// <summary>
        /// Мать
        /// </summary>
        [Description("38 - Мать")]
        Mother = 38,

        /// <summary>
        /// Отец
        /// </summary>
        [Description("39 - Отец")]
        Father = 39,

        /// <summary>
        /// Опекун
        /// </summary>
        [Description("40 - Опекун")]
        Guardioan = 40,

        /// <summary>
        /// Попечитель
        /// </summary>
        [Description("41 - Попечитель")]
        Trustee = 41,

        /// <summary>
        /// Иной родственник
        /// </summary>
        [Description("42 - Иной родственник")]
        Other = 42
    }
}
