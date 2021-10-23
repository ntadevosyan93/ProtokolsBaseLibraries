using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Тип страхового полиса
    /// </summary>
    public enum PolicyType : byte
    {
        [Description("ОМС")]
        OMS = 1,

        [Description("ДМС")]
        DMS = 2,

        [Description("Не известно")]
        Unknown = 0
    }
}
