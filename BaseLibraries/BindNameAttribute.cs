using System;

namespace BaseLibraries
{
    public class BindName : Attribute
    {
        public string Name { get; private set; }
        public BindName(string name)
        {
            Name = name;
        }
    }
}
