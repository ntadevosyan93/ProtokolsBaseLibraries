using BaseLibraries.Abstractions.Models.MaternityHospital;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MaternityHospital.Views
{
    public class View_TaskList : ITaskView
    {
        [Key]
        public int id { get; set; }
        public string dog_num { get; set; }
        public DateTime date_begin { get; set; }
        public string room_num { get; set; }
        public string patient_fio { get; set; }
        public int? age { get; set; }
        public string employee_fio { get; set; }
        public string service_name { get; set; }
        public Common.MH.TaskStatus status { get; set; }

        public virtual List<View_TaskPage> Details { get; set; }

        public View_TaskList()
        {
            Details = new List<View_TaskPage>();
        }
    }
}
