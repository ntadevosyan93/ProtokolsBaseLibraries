using BaseLibraries.Abstractions.Models.MaternityHospital;
using BaseLibraries.Common;
using BaseLibraries.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MaternityHospital.Views
{
    public class View_TaskPage : ITaskPageView
    {
        [Key]
        public int id { get; set; }

        public int? idm_task { get; set; }

        public DateTime date_in { get; set; }
        [NotMapped]
        public string time { get { return date_in.ToString("HH:mm:ss"); } }

        public PatientGeneralState patient_state { get; set; }

        public BirhtHistoryPageType page_type { get; set; }

        [NotMapped]
        public string state { get { return EnumHelper.GetEnumDescription(patient_state); } }

        [NotMapped]
        public string page_name {get { return EnumHelper.GetEnumDescription(page_type); } }

        public string notes { get; set; }



        [ForeignKey("idm_task")]
        public virtual View_TaskList TaskView {get;set;}
    }
}
