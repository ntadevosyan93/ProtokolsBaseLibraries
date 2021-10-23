using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IEmployeePharmView : IEntity, IParentNode<IPharm>
    {
        int? idm_mkb10 { get; set; }
        int? sort_idx { get; set; }
        string name { get; set; }
    }
}
