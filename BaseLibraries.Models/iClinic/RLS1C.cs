using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class RLS1C
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("NAME")]
        public string name { get; set; }

        [ColumnMap("NDV")]
        public string ndv { get; set; }

        [ColumnMap("TRADENAME")]
        public string trade_name { get; set; }
    }
}
