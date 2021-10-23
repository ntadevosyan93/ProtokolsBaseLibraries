using BaseLibraries.Common;

namespace BaseLibraries.Interfaces
{

    public interface IStyleSpecification
    {
        decimal Size { get; set; }

        FontStyle Style { get; set; }

        TextAlign Align { get; set; }
    }
}
