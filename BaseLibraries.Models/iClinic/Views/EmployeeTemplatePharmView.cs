using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Models.iClinic.F025;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic.Views
{
    public class EmployeeTemplatePharmView : IEmployeePharmView
    {
        public int id { get; set; }
        public int idm_employee { get; set; }
        public int? idm_mkb10 { get; set; }
        public int? sort_idx { get; set; }
        public string name { get; set; }
        public List<IPharm> Nested { get; set; }

        public EmployeeTemplatePharmView()
        {
            Nested = new List<IPharm>();
        }

        public override string ToString()
        {
            return name;
        }
    }
}
