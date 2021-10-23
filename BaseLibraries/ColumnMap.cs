using System;

namespace BaseLibraries
{


    public class ColumnMap : Attribute
    {
        public string Name { get; private set; }
        public string Caption { get; private set; }
        public byte OrderID { get; private set; }
        public bool FullBlank { get; private set; }

        public ColumnMap(string name)
        {
            Name = name;
            FullBlank = false;
        }

        public ColumnMap(string name, string caption) : this(name)
        {
            Caption = caption;
        }

        public ColumnMap(string name, string caption, byte orderId) : this(name, caption)
        {
            OrderID = orderId;
        }

        public ColumnMap(string name, string caption, byte orderId,bool fullBlank) : this(name, caption, orderId)
        {
            FullBlank = fullBlank;
        }
    }
}
