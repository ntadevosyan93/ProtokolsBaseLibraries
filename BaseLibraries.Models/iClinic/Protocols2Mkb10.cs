using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class Protocols2Mkb10
    {
        [Key]
        public int id { get; set; }
        public DateTime? date_in { get; set; }
        public int? idm_empl { get; set; }
        public int? idm_task { get; set; }
        public int? idm_protocol { get; set; }
        public int? idm_mkb10 { get; set; }
    }
}
