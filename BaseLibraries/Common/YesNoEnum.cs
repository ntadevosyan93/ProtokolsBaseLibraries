using System.ComponentModel;

namespace BaseLibraries.Common
{
    public enum YesNoEnum : byte
    {
        [Description("Да")]
        Yes = 1,

        [Description("Нет")]
        No = 0
    }
}
