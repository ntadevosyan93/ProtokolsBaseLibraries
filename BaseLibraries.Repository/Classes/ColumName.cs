using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Classes
{
    public class ColumName : Attribute
    {
        public string Name { get; private set; }
        public ColumName(string name)
        {
            Name = name;
        }
    }
}
