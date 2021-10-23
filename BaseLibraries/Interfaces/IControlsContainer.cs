using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public interface IControlsContainer<T> where T : IControlSpecification<T>
    {
        int ID { get; set; }

        string Name { get; set; }

        string Title { get; set; }

        string Footer { get; set; }

        List<T> Controls { get; set; }
    }
}
