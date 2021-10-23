using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common.Grid
{

    public class DTOFilter
    {
        public int id { get; set; }

        public string text { get; set; }

        public int? count { get; set; }

        public string header_count
        {
            get
            {
                return string.Format("{0} ({1})", text, count);
            }
        }
    }

}
