using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Семейные отношения
    /// </summary>
    public enum MaritalStatus : byte
    {
        /// <summary>
        /// Женат(замужем)
        /// </summary>
        [Description("Женат(замужем)")]
        Married = 1,

        /// <summary>
        /// Не женат(не замужем)
        /// </summary>
        [Description("Не женат(не замужем)")]
        NoMarried = 2,

        /// <summary>
        /// Не известно
        /// </summary>
        [Description("Не известно")]
        Unknown = 3
    }
}
