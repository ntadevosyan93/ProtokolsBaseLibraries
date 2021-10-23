using BaseLibraries.Common;
using System;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IProtocolView
    {
        int idm_task { get; set; }
        int idm_place { get; set; }
        int idm_patient { get; set; }
        int idm_employee { get; set; }
        int idm_services { get; set; }
        string p_text { get; set; }
        TaskStatus status { get; set; }
        DateTime date_in { get; set; }
        DateTime? date_cor { get; set; }
        string dog_num { get; set; }
        int task_num_1c { get; set; }
        short idm_1c_row { get; set; }
        DateTime task_date_1c { get; set; }
        string employee_fio { get; set; }
        string employee_cat { get; set; }
        string employee_academ { get; set; }
        string spec_text { get; set; }
        string s_text { get; set; }
        string pat_fio { get; set; }
        string pat_gender { get; set; }
        DateTime pat_date_b { get; set; }
        byte pat_age { get; set; }
        int? s_showFooter { get; set; }
        int? version { get; set; }
        string escort { get; set; }
        bool unlocked { get; }
        TaskTypes type { get; set; }
        bool? tele { get; set; }
    }
}
