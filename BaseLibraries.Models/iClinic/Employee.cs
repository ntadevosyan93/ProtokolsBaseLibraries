using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class Employee : IPerson, IEmployeeView
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(250)]
        [ColumnMap("fio")]
        [Display(Name = "ФИО")]
        public string fio { get; set; }

        [ColumnMap("gender")]
        public Gender? gender { get; set; }

        [ColumnMap("login")]
        public string login { get; set; }

        [ColumnMap("password")]
        public string password { get; set; }

        [ColumnMap("cat")]
        public string cat { get; set; }

        [ColumnMap("academ")]
        public string academ { get; set; }

        [StringLength(60)]
        [ColumnMap("guid")]
        public string guid { get; set; }

        [ColumnMap("security")]
        public string security { get; set; }

        [ColumnMap("phone")]
        public string phone { get; set; }

        [ColumnMap("DontChangePhone")]
        public YesNoEnum? DontChangePhone { get; set; }

        [ColumnMap("admin")]
        public YesNoEnum? admin { get; set; }

        [ColumnMap("eko")]
        public YesNoEnum? eko { get; set; }

        [ColumnMap("dialize")]
        public YesNoEnum? dialize { get; set; }

        [ColumnMap("dental")]
        public YesNoEnum? dental { get; set; }

        [ColumnMap("mail")]
        public string mail { get; set; }

        [ColumnMap("info")]
        public string info { get; set; }

        [ColumnMap("photo_link")]
        public string photo_link { get; set; }

        [ColumnMap("sms_send_notice_patient_came")]
        public YesNoEnum? sms_send_notice_patient_came { get; set; }

        [ColumnMap("cur_state_id")]
        public short? cur_state_id { get; set; }

        [ColumnMap("dont_edit_service")]
        public bool allow_service_time { get; set; }

        [ColumnMap("IsDepartmentHead")]
        public bool IsDepartmentHead { get; set; }

        [ColumnMap("IsModerator")]
        public bool IsModerator { get; set; }

        [ColumnMap("IsProtocolReset")]
        public bool IsProtocolReset { get; set; }

        [ColumnMap("IsProtocolEdit")]
        public bool IsProtocolEdit { get; set; }

        //TODO Employee date_b
        [NotMapped()]
        public DateTime? date_b { get; set; }

        //TODO Employee age
        [NotMapped()]
        public byte? age { get; set; }

        public string gender_str { get
            {
                return this.GenderAsString();
            }
        }
    }
}
