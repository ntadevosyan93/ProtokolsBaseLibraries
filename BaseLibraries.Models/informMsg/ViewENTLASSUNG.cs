using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg
{
    [Table("dbo.ViewENTLASSUNG")]
    public class ViewENTLASSUNG: IEditENTLASSUNGBatch
    {
        [NotMapped]
        public int id { get; set; }

        [Key]
        [Column("id")]
        public int idm_ent {
            get { return id; }
            set { id = value; } }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public string user_cur { get; set; }

        public DateTime? date_cur { get; set; }

        public int? idm_employee { get; set; }

        public int? idm_chif { get; set; }

        public int? idm_dolj { get; set; }

        public int? idm_otdel { get; set; }

        public int? idm_org { get; set; }

        public DateTime? date_ext { get; set; }

        public string Note { get; set; }

        public bool? del { get; set; }

        public string fio { get; set; }

        public string org { get; set; }

        public string dolj { get; set; }

        public string otdel { get; set; }

    }
}
