using BaseLibraries.Abstractions.Models.iClinic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Abstractions.Models
{
    public interface IPatient : IPerson, IPersonAddress
    {
        string fam { get; set; }
        string name { get; set; }
        string otch { get; set; }
        string phone { get; set; }
    }
}
