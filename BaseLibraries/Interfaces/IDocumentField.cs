using System.ComponentModel;

namespace BaseLibraries.Interfaces
{
    public interface IDocumentField
    {
        string Name { get; set; }
        string Prefix { get; set; }
        string Postfix { get; set; }
        FieldFormats FieldFormat { get; set; }
        string Value { get; }
    }

    public enum FieldFormats : byte
    {
        [Description("Без форматирования")]
        Default = 0,

        [Description("Все прописные")]
        AllUpperCase = 1,

        [Description("Все строчные")]
        AllLowerCase = 2,

        [Description("Первая прописная")]
        FirstUpperCase = 3,

        [Description("Начинать с прописных")]
        StartWithUpperCase = 4,
    }
}
