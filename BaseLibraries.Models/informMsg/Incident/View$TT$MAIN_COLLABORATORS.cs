using BaseLibraries.Interfaces;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.View$TT$MAIN_COLLABORATORS")]
    public class View_TT_MAIN_COLLABORATORS : ICOLLABORATORS, ICreate
    {
        [Key]
        public int id { get; set; }

        [Display(Name ="Пользователь")]
        public string user_in { get; set; }

        [Display(Name = "Дата")]
        public DateTime? date_in { get; set; }

        [Display(Name = "Фамилия")]
        public string fio { get; set; }

        [Display(Name ="Соисполнитель")]
        public int? idm_isp_coll { get; set; }

        public int? idm_main { get; set; }

        public int? del { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
