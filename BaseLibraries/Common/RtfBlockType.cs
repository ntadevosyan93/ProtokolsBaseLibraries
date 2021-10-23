using System.ComponentModel;

namespace BaseLibraries.Common
{
    public enum RtfBlockType : byte
    {
        /// <summary>
        /// Жалобы
        /// </summary>
        [Description("Жалобы")]
        Lament = 0,

        /// <summary>
        /// Анамнез
        /// </summary>
        [Description("Анамнез")]
        Anamnez = 1,

        /// <summary>
        /// Объективный статус
        /// </summary>
        [Description("Объективный статус")]
        Objective = 2,

        /// <summary>
        /// Осложнения
        /// </summary>
        [Description("Осложнения")]
        Complications = 5,


        /// <summary>
        /// Заключение
        /// </summary>
        [Description("Заключение")]
        Conclusion = 6,

        /// <summary>
        /// Обоснование диагноза
        /// </summary>
        [Description("Обоснование диагноза")]
        Justification = 7,


        /// <summary>
        /// Локальный статус
        /// </summary>
        [Description("Локальный статус")]
        Localis = 8



    }
}
