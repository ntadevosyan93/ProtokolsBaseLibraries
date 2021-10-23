namespace BaseLibraries.Common
{
    /// <summary>
    /// Тип таска
    /// </summary>
    public enum ServiceTypeEnum
    {
        /// <summary>
        /// Лабораторная диагностика 1124
        /// </summary>
        Lab,

        /// <summary>
        /// Консультация 1125
        /// </summary>
        Consultation,

        /// <summary>
        /// Инструментальная диагностика 1126
        /// </summary>
        Instrumental,

        /// <summary>
        /// Гистология 5194, 5195, 5196
        /// </summary>
        Hystologic,

        /// <summary>
        /// Стационар 285
        /// </summary>
        Hospital,

        /// <summary>
        /// Повторный прием
        /// </summary>
        Repeat,

        /// <summary>
        /// Онлайн прием
        /// </summary>
        Tele,

        /// <summary>
        /// Гинекология 1140
        /// id_parent=1140 в [iClinic].[dbo].[SERVICES]
        /// </summary>
        Gynecology,

        /// <summary>
        /// Тип не определен
        /// </summary>
        Undefined
    }
}
