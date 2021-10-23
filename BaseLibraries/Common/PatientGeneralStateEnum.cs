using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Перечень общих состояний пациента
    /// </summary>
    public enum PatientGeneralState : byte
    {

        /// <summary>
        /// Удовлетворительное
        /// </summary>
        [Description("Удовлетворительное")]
        Satisfactory,

        /// <summary>
        /// Средней тяжести
        /// </summary>
        [Description("Средней тяжести")]
        Moderate_severity,

        /// <summary>
        /// Тяжелое
        /// </summary>
        [Description("Тяжелое")]
        Heavy,

        /// <summary>
        /// Крайне тяжелое
        /// </summary>
        [Description("Крайне тяжелое")]
        Extremely_difficult,

        /// <summary>
        /// Терминальное
        /// </summary>
        [Description("Терминальное")]
        Terminal,

        /// <summary>
        /// Состояние клинической смерти
        /// </summary>
        [Description("Состояние клинической смерти")]
        Clinical_death_state,

        /// <summary>
        /// Не указано
        /// </summary>
        [Description("Не указано")]
        NA, 
    }
}
