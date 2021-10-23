using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface  IEmployee: IEmplKey
    {


        string fam { get; set; }

        string name { get; set; }

        string otch { get; set; }

        string FullName { get; }
    }

    public interface IEmplKey
    {
        int id { get; set; }
    }

    public interface IGuidClinic: IEmplKey
    {
        string guid_iclinic { get; set; }
    }
}
