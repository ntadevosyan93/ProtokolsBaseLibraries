using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Пол
    /// </summary>
    public enum Gender : byte
    {
        [Description("Женский")]
        F = 1,

        [Description("Мужской")]
        M = 2
    }
}
