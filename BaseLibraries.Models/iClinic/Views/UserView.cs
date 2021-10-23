using BaseLibraries.Abstractions.Models;

namespace BaseLibraries.Models.iClinic.Views
{
    public class UserView : IUser
    {
        public int id { get; set; }
        public string id1c { get; set; }
        public string fio { get; set; }
        public string pass { get; set; }
        public string doctor_cat { get; set; }
        public string doctor_academ { get; set; }

        public bool logined { get; set; }
        public bool admin { get; set; }
        public bool eko { get; set; }
        public string guid { get; set; }
        public string mail { get; set; }
        public string mail_pwd { get; set; }
        public bool show_check_list { get; set; }
        public bool is_test_user { get; set; }
        public string lk_api_guid { get; set; }
        public bool allow_service_time { get; set; }

        public bool IsDepartmentHead { get; set; }
        public bool IsModerator { get; set; }
        public bool IsProtocolReset { get; set; }
        public bool IsProtocolEdit { get; set; }            // AVA 23.08.2021 https://clinic.bitrix24.ru/workgroups/group/32/tasks/task/view/1532/
    }
}
