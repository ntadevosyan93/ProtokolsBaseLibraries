using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IMessage
    {
        int id { get; set; }
        int? db_table_id { get; set; }
        string guid { get; set; }
        [Display(Name = "Дата ")]
        DateTime? date_in { get; set; }
        [Display(Name = "Пользователь ")]
        string user_in { get; set; }
        [Display(Name="Текст ")]
        string text { get; set; }
    }
}
