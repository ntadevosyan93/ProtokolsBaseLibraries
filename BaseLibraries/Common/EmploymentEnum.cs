using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы занятости
    /// </summary>
    public enum Employment : byte
    {
        /// <summary>
        /// Работает
        /// </summary>
        [Description("Работает")]
        Work = 1,

        /// <summary>
        /// Проходит военную или приравненную к ней, службу
        /// </summary>
        [Description("Проходит военную или приравненную к ней, службу")]
        Military = 2,

        /// <summary>
        /// Пенсионер(ка)
        /// </summary>
        [Description("Пенсионер(ка)")]
        Pensioner = 3,

        /// <summary>
        /// Студент(ка)
        /// </summary>
        [Description("Студент(ка)")]
        Student = 4,

        /// <summary>
        /// Не работает
        /// </summary>
        [Description("Не работает")]
        NotWork = 5,

        /// <summary>
        /// Прочее
        /// </summary>
        [Description("Прочее")]
        Another = 6
    }
}
