using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;


namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.KLASS")]
    public class KlassInform
    {
        public int id { get; set; }

        public int? klass_id { get; set; }

        public string klass_name { get; set; }

        public string klass_name_short { get; set; }

        public string klass_value { get; set; }

        public int? klass_value_int { get; set; }
    }
}
