using BaseLibraries.Common;
using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public interface IControlSpecification
    {
        int OrderIdx { get; set; }

        string Name { get; set; }

        string Caption { get; set; }

        string ComplexTemplateText { get; set; }

        EditorType EditorType { get; set; }

        List<string> ChoiseData { get; set; }

        bool IsRequeried { get; set; }

        bool ReadOnly { get; set; }

        IStyleSpecification Style { get; set; }

        bool IsGroup { get; }
    }

    public interface IControlSpecification<T> : IControlSpecification where T : IControlSpecification {
        List<T> SubControls { get; set; }
    }
}
