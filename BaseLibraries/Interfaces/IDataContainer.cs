using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public interface IDataContainer<T> where T : IKeyValue<T>
    {
        int TemplateID { get; set; }

        string Name { get; set; }

        string Footer { get; set; }

        List<T> Package { get; set; }
    }
}
