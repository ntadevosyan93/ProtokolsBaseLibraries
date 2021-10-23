using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.PriceSRV
{
    public class DiscountList
    {
        [Key]
        public int id { get; set; }
        public DateTime date_in { get; set; }
        public string user_in { get; set; }
        public string description { get; set; }
        public DateTime? date_start { get; set; }
        public DateTime? date_stop { get; set; }
        public byte? all_patient { get; set; }
        public byte? all_filial { get; set; }
        public byte? all_services { get; set; }
        public byte? save_conditions { get; set; }
        public byte? type { get; set; }
        public string guid { get; set; }
        public DateTime? date_cur { get; set; }
        public string user_cur { get; set; }

        public virtual ICollection<DiscountRule> Rules { get; set; } 
        public virtual ICollection<DiscountEmployee> Employees { get; set; }
        public virtual ICollection<DiscountFilial> Filials { get; set; }
        public virtual ICollection<DiscountPatient> Patients { get; set; }
        public virtual ICollection<DiscountServices> Services { get; set; }

        public DiscountList()
        {
            Rules = new HashSet<DiscountRule>();
            Employees = new HashSet<DiscountEmployee>();
            Filials = new HashSet<DiscountFilial>();
            Patients = new HashSet<DiscountPatient>();
            Services = new HashSet<DiscountServices>();
        }

        public override string ToString()
        {
            return description;
        }
    }
}
