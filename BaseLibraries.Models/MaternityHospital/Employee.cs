using BaseLibraries.Abstractions.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MaternityHospital
{
    [Table("List", Schema = "Employee")]
    public class Employee : IEntity,IPersonBase
    {
        [Key]
        public int id { get; set; }
        public string idm1c { get; set; }
        public string guid { get; set; }
        public string fio { get; set; }

        public DateTime? date_b { get; set; }
        

        public virtual ObservableCollection<Task> Tasks { get; set; }

        public Employee()
        {
            Tasks = new ObservableCollection<Task>();
        }

    }
}
