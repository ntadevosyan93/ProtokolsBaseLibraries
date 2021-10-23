using System.ComponentModel;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Группы крови
    /// </summary>
    public enum BloodType : byte
    {
        [Description("O(I)")]
        O_I = 1,

        [Description("A(II)")]
        A_II = 2,

        [Description("B(III)")]
        B_III = 3,

        [Description("AB(IV)")]
        AB_IV = 4,

        [Description("н\\у")]
        Unknown = 255
    }
}
