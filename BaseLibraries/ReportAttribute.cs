using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries
{
    public class ReportField : Attribute
    {
        public string Name { get; private set; }
        public bool IsNested { get; private set; }
        public bool IsEnumerable { get; private set; }

        public ReportField(string name, bool isNested = false,bool isEnumerable = false)
        {
            Name = name;
            IsNested = isNested;
            IsEnumerable = isEnumerable;
        }
    }
}
