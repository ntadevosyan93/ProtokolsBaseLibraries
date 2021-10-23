using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Статусы лечения
    /// </summary>
    public enum TherapyStatus : byte
    {
        [Description("Не начато")]
        NoStarted = 0,

        [Description("Ведется")]
        InProgress = 1,

        [Description("Приостановлено")]
        Hold = 2,

        [Description("Завершено успешно")]
        CompliteOk = 3,

        [Description("Завершено без результатно")]
        CompliteNoResult = 3,

    }
}
