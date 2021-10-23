using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries;
using BaseLibraries.Repository.Classes;

namespace BaseLibraries.Repository.DTO
{
    public class DTOFile
    {
        [Display(Name= "УИД")]
        [ColumName("id")]
        public int id { get; set; }
        [Display(Name = "Оригинальное имя")]
        [ColumName("file_name")] public string file_name { get; set; }
        [Display(Name = "Пользователь")]
        [ColumName("user_in")] public string user_in { get; set; }
        [Display(Name = "Добавлен")]
        [ColumName("date_in")] public DateTime? date_in { get; set; }
        [ColumName("guid")] public string guid { get; set; }
        [ColumName("file_guid")] public string file_guid { get; set; }
        [ColumName("file_path")] public string file_path { get; set; }
        [ColumName("db_table_id")] public int db_table_id { get; set; }
        [ColumName("ip_in")] public string ip_in { get; set; }
        [ColumName("del")] public int? del { get; set; }
        [ColumName("module")] public string module { get; set; }
        [ColumName("db_table")] public string db_table { get; set; }
        [Display(Name = "Описание")][ColumName("description")] public string description { get; set; }
        [Display(Name = "комментарий удаления")] [ColumName("comment_del ")] public string comment_del { get; set; }
    }
}
