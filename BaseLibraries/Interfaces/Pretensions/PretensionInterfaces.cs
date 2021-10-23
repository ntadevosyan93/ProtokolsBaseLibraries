using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces.Pretensions
{
    public interface IPreKey
    {
        int id { get; set; }
    }


    public interface IPreKeyGuid
    {
        string guid { get; set; }
    }


    public interface IPatientPretension : IHistory,  IPreKeyGuid
    {
        int? idm_patient { get; set; }
    }

    public interface IStatusPretension : IPreKeyGuid
    {
        int? status { get; set; }
    }

    public interface IPretensionDate : IPreKeyGuid
    {
        DateTime? date_stop { get; set; }
    }

    public interface IPretensionsForm : IHistory,  IPreKeyGuid
    {
        int? status { get; set; }
        string idm_1c { get; set; }
        string fio { get; set; }
        int? idm_patient { get; set; }
        int? idm_departments { get; set; }
        int? idm_empl { get; set; }
        string description { get; set; }
        string text_solution { get; set; }
        DateTime? date_start { get; set; }
        DateTime? date_stop { get; set; }
        DateTime? date_stop_plan { get; set; }
        int? idm_control { get; set; }
        int? idm_source { get; set; }
        int? idm_doctor { get; set; }
    }
}
