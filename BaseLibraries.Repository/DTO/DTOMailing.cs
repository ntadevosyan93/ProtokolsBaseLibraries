using BaseLibraries.Repository.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.DTO
{
    public class DTOMailing
    {
        [ColumName("id")]
        public int id { get; set; }
        [ColumName("IsSend")]
        [Display(Name = "Отправлено")]
        public byte? IsSend { get; set; }
        [ColumName("empl")]
        [Display(Name="Сотрудник" )]
        public string empl { get; set; }
        [ColumName("idm_empl")]
        [Display(Name = "Сотрудник")]
        public int? idm_empl_mail { get; set; }
        [ColumName("db_table_id")]
        public int? db_table_id { get; set; }
        [ColumName("db_table_name")]
        public string db_table_name { get; set; }

    }
}
