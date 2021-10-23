using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Типы заболеваний/диагноза
    /// </summary>
    public enum DiagnosisTypes : byte
    {
        [Description("Диагноз основного заболевания")]
        Base = 0,

        [Description("Сопутствующее заболевание")]
        Sattelite = 1,

        [Description("Внешняя причина при травмах (отравлениях)")]
        OutClause = 2,
    }
}
