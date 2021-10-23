using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IULayoutControl<T> where T : IControlSpecification<T>
    {
        int Idm_Template { get; set; }
        string Title { get; set; }

        void Build(IControlsContainer<T> specification);
        bool Validate();
    }
}
