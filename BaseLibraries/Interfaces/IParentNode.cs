using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public interface IParentNode<T> where T :class
    {
        List<T> Nested { get; set; }
    }
}
