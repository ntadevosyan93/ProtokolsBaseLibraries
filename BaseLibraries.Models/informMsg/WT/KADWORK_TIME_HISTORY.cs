
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BaseLibraries.Interfaces;

namespace BaseLibraries.Models.informMsg.WT
{
    [Table("dbo.KAD$WORK_TIME_HISTORY")]
    public class Kadwork_time_history  
    {
         
        public string guid { get; set; }

        public int id { get; set; }


        public DateTime? date_in { get; set; }


        public string user_in { get; set; }


        public int? idm_empl { get; set; }


        public DateTime? estimated_start { get; set; }


        public DateTime? estimated_stop { get; set; }


        public DateTime? actual_start { get; set; }


        public DateTime? actual_stop { get; set; }


        public byte? del { get; set; }


        public DateTime? break_start { get; set; }


        public DateTime? break_stop { get; set; }


        public short? break_time { get; set; }


        public int? idm_status { get; set; }


        public int? idm_depart { get; set; }


        public int? freeDay { get; set; }


        public string comment { get; set; }


        public int? handmark { get; set; }


        public byte? from_1c { get; set; }


        public string curatorComment { get; set; }


        public DateTime? actual_start_2 { get; set; }


        public DateTime? actual_stop_2 { get; set; }


        public int? freeDay_2 { get; set; }


        public int? sb_ok { get; set; }

        [Column("user_cor")]
        public string user_cur { get; set; }

        [Column("date_cor")]
        public DateTime? date_cur { get; set; }


        public int? idm_violation { get; set; }


        public int? idm_breakdown { get; set; }


        public string comment_it { get; set; }


        public int? idm_doljn { get; set; }


        public DateTime? first_checkIn { get; set; }


        public byte? is_lock { get; set; }


        public byte? fast_control { get; set; }


        public bool? sb { get; set; }


        public string prichina { get; set; }

        [Column("fixed")]
        public bool? fix { get; set; }



    }
}
