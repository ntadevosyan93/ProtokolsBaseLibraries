using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы образования
    /// </summary>
    public enum Education : byte
    {
        //высшее – 1, среднее – 2; общее: среднее – 3, основное – 4, начальное – 5; неизвестно – 6.
        /// <summary>
        /// Высшее
        /// </summary>
        [Description("Высшее")]
        Higher = 1,

        /// <summary>
        /// Среднее
        /// </summary>
        [Description("Среднее")]
        Secondary = 2,

        /// <summary>
        /// Общее стреднее
        /// </summary>
        [Description("Общее стреднее")]
        GeneralSecondary = 3,

        /// <summary>
        /// Основное
        /// </summary>
        [Description("Основное")]
        Basic = 4,

        /// <summary>
        /// Начальное
        /// </summary>
        [Description("Начальное")]
        Primary = 5,

        /// <summary>
        /// Не известно
        /// </summary>
        [Description("Не известно")]
        Unknown = 6
    }
}
