using BaseLibraries.Interfaces;
using BaseLibraries.Interfaces.Pretensions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.TT$Pretensions")]
    public class TT_Pretensiya:IHistory, IPretensionsForm, IPatientPretension, IStatusPretension, IPretensionDate
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? idm_departments { get; set; }

        public string fio { get; set; }

        public string phone { get; set; }

        public string email { get; set; }

        public string zakazNum { get; set; }

        public DateTime? DateFull { get; set; }

        public DateTime? DateB { get; set; }

        public int? idm_source { get; set; }

        public string description { get; set; }

        public DateTime? date_start { get; set; }

        public DateTime? date_stop { get; set; }

        public string text_solution { get; set; }

        public int? idm_empl { get; set; }

        public int? status { get; set; }

        public string guid { get; set; }

        public int? del { get; set; }

        public DateTime? date_stop_plan { get; set; }

        public int? idm_control { get; set; }

        public DateTime? date_cur { get; set; }

        public string user_cur { get; set; }

        public int? idm_patient { get; set; }

        public string idm_1c { get; set; }

        public int? idm_doctor { get; set; }
    }
}
