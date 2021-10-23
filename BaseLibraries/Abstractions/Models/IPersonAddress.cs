using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Abstractions.Models
{
    public interface IPersonAddress
    {
        string addr_registr { get; set; }

        IAddressData StructedAddress { get; set; }
    }
}
