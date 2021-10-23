using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Classes
{
    public class FilterTypeGrid
    {
        public string field { get; set; }
        public string type { get; set; }
        public string param { get; set; }
        public string val { get; set; }

        public string[] arr { get; set; }

        public int? id { get; set; }

        public DateTime? dtone { get; set; }

        public DateTime? start { get; set; }
        public DateTime? stop { get; set; }

    }
}
