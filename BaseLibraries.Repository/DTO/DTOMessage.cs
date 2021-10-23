using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.DTO
{
    public class DTOMessage:IMessage
    {
        public int id { get; set; }
        public int? db_table_id { get; set; }
        public string guid { get; set; }
         [Display(Name = "Дата ")]
        public DateTime? date_in { get; set; }
         [Display(Name = "Пользователь ")]
        public string user_in { get; set; }
         [Display(Name = "Текст ")]
        public string text { get; set; }
    }
}
