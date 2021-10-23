﻿using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.Incident
{
    [Table("dbo.View$TT$MAIN_NEW")]
    public class View_TT_MAIN_NEW : ICreate
    {
        [Key]
        public int id { get; set; }

        public string user_in { get; set; }

        public DateTime? date_in { get; set; }

        public int? idm_departments { get; set; }

        public string department_str { get; set; }

        public string text_problem { get; set; }

        public DateTime? date_start { get; set; }

        public DateTime? date_stop { get; set; }

        public string text_solution { get; set; }

        public int? idm_empl { get; set; }

        public string isp { get; set; }

        public int? status { get; set; }

        public string status_str { get; set; }

        public string guid { get; set; }

        public int? del { get; set; }

        public int? idm_activity { get; set; }

        public string text { get; set; }

        public string textsolution { get; set; }

        public string textproblem { get; set; }

        public int? idm_place { get; set; }

        public int? idm_object { get; set; }

        public int? idm_os { get; set; }

        public string os_inv { get; set; }

        public int? idm_control { get; set; }


        public int? idm_patient { get; set; }

        public string patient_str { get; set; }

        public DateTime? db_patient { get; set; }

        public string short_text_solution { get; set; }

        public string short_text_problem { get; set; }

        public string isp_coll { get; set; }

        public int? idm_COLLABORATOR { get; set; }


        
    }
}
