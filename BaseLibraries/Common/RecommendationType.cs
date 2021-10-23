using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Виды рекомендаций
    /// Для добавления элементов в комбобокс (comboBox.Properties.Items.AddEnum(typeof(RecommendationType), false);)
    /// </summary>
    public enum RecommendationType : byte
    {
        /// <summary>
        /// Режим
        /// </summary>
        [Description("Режим")]
        Mode = 8,
        
        /// <summary>
        /// Диета
        /// </summary>
        [Description("Диета")]
        Diet = 1,

        /// <summary>
        /// Рекомендованные доп. исследования
        /// </summary>
        [Description("Рекомендации")]
        MunaulRecommendation = 2,

        /// <summary>
        /// Инструментальная диагностика
        /// </summary>
        [Description("Инструментальная диагностика")]
        InstrumentalDiagnostics = 3,

        /// <summary>
        /// Лаболаторная диагностика
        /// </summary>
        [Description("Лаболаторная диагностика")]
        LaboratoryDiagnostics = 4,

        /// <summary>
        /// Консультация специалиста
        /// </summary>
        [Description("Консультация специалиста")]
        Consultation = 5,

        /// <summary>
        /// Повторная явка
        /// </summary>
        [Description("Повторная явка")]
        RepeatedTurnout = 6,

        /// <summary>
        /// Мед. процедуры
        /// </summary>
        [Description("Мед. процедуры")]
        MedicalProcedure = 7,

        /// <summary>
        /// Лечение
        /// </summary>
        [Description("Лечение")]
        Threatment = 8


    }
}
