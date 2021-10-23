using BaseLibraries.Abstractions.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class TasksPharm : IEntity
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [ColumnMap("user_in")]
        public string user_in { get; set; }

        [ColumnMap("idm_task")]
        public int? idm_task { get; set; }

        [StringLength(50)]
        [ColumnMap("idm_filial_1c")]
        public string idm_filial_1c { get; set; }

        [StringLength(50)]
        [ColumnMap("idm_pharm_1c")]
        public string idm_pharm_1c { get; set; }

        [ColumnMap("idm_filial")]
        public int? idm_filial { get; set; }

        [ColumnMap("idm_pharm")]
        public int? idm_pharm { get; set; }

        [ColumnMap("count")]
        public decimal? count { get; set; }

        [ColumnMap("pricePerUnit")]
        public decimal? pricePerUnit { get; set; }

        [ColumnMap("del")]
        public int? del { get; set; }

        [StringLength(50)]
        [ColumnMap("user_cor")]
        public string user_cor { get; set; }

        [ColumnMap("date_cor")]
        public DateTime? date_cor { get; set; }

        [ColumnMap("sended")]
        public int? sended { get; set; }

        [ColumnMap("idm_content_template")]
        public int? idm_content_template { get; set; }
    }
}
