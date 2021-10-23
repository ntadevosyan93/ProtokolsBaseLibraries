using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MaternityHospital
{
    [Table("List", Schema = "Patient")]
    public class Patient : IEntity, IPersonBase
    {
        [Key]
        public int id { get; set; }

        [Column("idm_1c")]
        public string idm_1c { get; set; }

        [Column("guid")]
        public string guid { get; set; }

        [Column("fio")]
        [DisplayName("ФИО")]
        public string fio { get; set; }

        [Column("nati")]
        [DisplayName("Национальность")]
        public string nati { get; set; }

        [DisplayName("Дата рождения")]
        public DateTime? date_b { get; set; }

        [DisplayName("Группа крови")]
        public BloodType blood_type { get; set; }

        [DisplayName("Резус")]
        public RhFactor rh_factor { get; set; }

        [DisplayName("Аллергические реакции")]
        public string allergic_reactions { get; set; }

        public string phone { get; set; }

        public virtual ObservableCollection<Task> Tasks { get; set; }

        public Patient()
        {
            Tasks = new ObservableCollection<Task>();
        }

        public override string ToString()
        {
            return fio;
        }
    }
}
