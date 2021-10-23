using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.KAD$ENTLASSUNG_EMPLOYEE")]
    public class KAD_ENTLASSUNG_EMPLOYEE:IHistory
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public int? idm_employee { get; set; }

        public int? idm_dolj { get; set; }

        public int? idm_otdel { get; set; }

        public int? idm_org { get; set; }

        public int? idm_chif { get; set; }

        public DateTime? date_ext { get; set; }

        public string Note { get; set; }

        public bool? del { get; set; }
    }
}