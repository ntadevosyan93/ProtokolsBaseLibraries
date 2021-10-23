using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace BaseLibraries.Models.iClinic
{
    public class Klass
    {

            //[Key]
            //[Column(Order = 1)]
            public string klass_name { get; set; }

            public string klass_value { get; set; }

            //[Key]
            //[Column(Order = 2)]
            public short klass_id { get; set; }

            public int klass_id_int { get { return (int)klass_id; } }

            public int? klass_int { get; set; }

            public string klass_value_short { get; set; }

            public bool? klass_value_hide { get; set; }

            [NotMapped]
            public int? count { get; set; }

        

    }
}
