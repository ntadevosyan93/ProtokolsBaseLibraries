using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IDocumentTemplate<T> where T :class,IControlSpecification<T> 
    {
        int Idm_Template { get; set; }
        string Title { get; set; }
        string JSON { get; set; }
        List<IFieldToControl<T>> Container { get; }
    }
}
