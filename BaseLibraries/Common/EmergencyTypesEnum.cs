using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы экстренных извещений
    /// </summary>
    public enum EmergencyTypesEnum : byte
    {
        /// <summary>
        /// Инфекционное заболевание
        /// </summary>
        [Description("Инфекционное заболевание")]
        Infectious = 10,

        /// <summary>
        /// Пищевое отравление
        /// </summary>
        [Description("Пищевое отравление")]
        FoodPoisoning = 20,

        /// <summary>
        /// Острое, проф. отравление
        /// </summary>
        [Description("Острое, проф. отравление")]
        AcutePoisoning = 30,

        /// <summary>
        /// Необычная реакция на прививку
        /// </summary>
        [Description("Необычная реакция на прививку")]
        UnusualReactionVaccination = 40
    }
}
