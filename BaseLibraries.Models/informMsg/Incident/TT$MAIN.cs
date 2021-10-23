using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.TT$MAIN")]
    public class TT_MAIN : IHistory, IIncident
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? idm_departments { get; set; }

        public string text_problem { get; set; }

        public DateTime? date_start { get; set; }

        public DateTime? date_stop { get; set; }

        public string text_solution { get; set; }

        public int? idm_empl { get; set; }

        public int? status { get; set; }

        public string guid { get; set; }

        public int? del { get; set; }

        public int? idm_activity { get; set; }

        public int? idm_place { get; set; }

        public int? idm_object { get; set; }

        public int? idm_os { get; set; }

        public string os_inv { get; set; }

        public DateTime? date_cor { get; set; }

        public DateTime? date_stop_plan { get; set; }

        public int? status_continue { get; set; }

        public int? idm_os_sost { get; set; }

        public int? idm_control { get; set; }

        public int? idm_patient { get; set; }

        [Column("idm_1c")]
        public string idm_1c_patient { get; set; }

        [NotMapped]
        public DateTime? date_cur { get { return date_cor_update; } set { date_cor_update = value; } }

        public DateTime? date_cor_update { get; set; }

        [NotMapped]
        public string user_cur { get { return user_cor_update; } set { user_cor_update = value; } }

        public string user_cor_update { get; set; }

    }
}
