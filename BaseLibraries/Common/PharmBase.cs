using BaseLibraries.Abstractions.Models.iClinic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Common
{
    public class PharmBase : IPharm
    {
        [ColumnMap("order_id")]
        public int? order_id { get; set; }

        [DisplayName("Наименование препарата"), ColumnMap("pharm_name")]
        public string pharm_name { get; set; }

        [DisplayName("График приема"), ColumnMap("pharm_intake_schedule")]
        public string pharm_intake_schedule { get; set; }

        [DisplayName("Отменить"), ColumnMap("is_cancel")]
        public bool is_cancel { get; set; }

        [DisplayName("Причина отмены"), ColumnMap("cancel_reason")]
        public string cancel_reason { get; set; }

        [DisplayName("Назначение мс"), ColumnMap("medical_dosage")]
        public string medical_dosage { get; set; }

        [DisplayName("Наименование"), NotMapped]
        public string name { get { return this.ToString(); } }

        public override string ToString()
        {
            return pharm_name + " (" + pharm_intake_schedule + ")";
        }

        public PharmBase()
        {

        }

        public PharmBase(IPharm pharm)
        {
            order_id = pharm.order_id;
            pharm_name = pharm.pharm_name;
            pharm_intake_schedule = pharm.pharm_intake_schedule;
            medical_dosage = pharm.medical_dosage;
        }

    }
}
