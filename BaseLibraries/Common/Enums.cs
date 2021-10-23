using System.ComponentModel;
using System.Runtime.Serialization;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Начертание шрифта
    /// </summary>
    public enum FontStyle
    {
        /// <summary>
        /// Обычный
        /// </summary>
        [EnumMember(Value = "Regular")]
        Regular = 0,

        /// <summary>
        /// Жiрный
        /// </summary>
        [EnumMember(Value = "Bold")]
        Bold = 1,

        /// <summary>
        /// Курсив
        /// </summary>
        [EnumMember(Value = "Italic")]
        Italic = 2,
    }

    /// <summary>
    /// Положение текста
    /// </summary>
    public enum TextAlign
    {
        [EnumMember(Value = "Left")]
        Left = 0,

        [EnumMember(Value = "Middle")]
        Middle = 1,

        [EnumMember(Value = "Right")]
        Right = 2
    }

    /// <summary>
    /// Тип редактора
    /// </summary>
    public enum EditorType
    {
        [Description("Текстовое поле")]
        [EnumMember(Value = "Text")]
        Text = 0,

        [Description("Многосторочное поле")]
        [EnumMember(Value = "Memo")]
        Memo = 1,

        [Description("Дата")]
        [EnumMember(Value = "DateTime")]
        DateTime = 2,

        [Description("Числовой ввод")]
        [EnumMember(Value = "Numeric")]
        Numeric = 3,

        [Description("Перечеслитель")]
        [EnumMember(Value = "ComboBox")]
        ComboBox = 4,

        [Description("Комплексное")]
        [EnumMember(Value = "Complex")]
        Complex = 5,

        [Description("Флаг да/нет")]
        [EnumMember(Value = "CheckBox")]
        CheckBox = 6,


    }
}
