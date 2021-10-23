using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models
{
    public interface IUser
    {
        int id { get; set; }
        string id1c { get; set; }
        string fio { get; set; }
        string pass { get; set; }
        string doctor_cat { get; set; }
        string doctor_academ { get; set; }
        bool logined { get; set; }
        bool admin { get; set; }
        bool eko { get; set; }
        string guid { get; set; }
        string mail { get; set; }
        string mail_pwd { get; set; }
        bool show_check_list { get; set; }
        bool is_test_user { get; set; }
        string lk_api_guid { get; set; }
        bool allow_service_time { get; set; }
        bool IsDepartmentHead { get; set; }
        bool IsModerator { get; set; }
        bool IsProtocolReset { get; set; }
        bool IsProtocolEdit { get; set; }
    }
}
