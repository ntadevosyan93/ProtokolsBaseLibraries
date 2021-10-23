using BaseLibraries.Common.MH;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace BaseLibraries.Abstractions.Models.MaternityHospital
{
    public interface ITaskView : IEntity
    {
        string dog_num { get; set; }
        DateTime date_begin { get; set; } 
        string patient_fio { get; set; }
        string employee_fio { get; set; }
        string service_name { get; set; }
        TaskStatus status { get; set; }
    }
}
