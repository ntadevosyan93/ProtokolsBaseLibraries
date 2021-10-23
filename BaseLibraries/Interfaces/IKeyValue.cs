using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public interface IKeyValue : IBindingKeyValue
    {
        string Name { get; set; }

        object Value { get; set; }
    }

    public interface IKeyValue<T> : IKeyValue where T: IKeyValue
    {
        List<T> SubValues { get; set; }
    }
}
