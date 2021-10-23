using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Interfaces
{
    public interface IResult
    {
        int EntityID { get; set; }
        string Name { get; }
        bool Ok { get; }
    }
}
