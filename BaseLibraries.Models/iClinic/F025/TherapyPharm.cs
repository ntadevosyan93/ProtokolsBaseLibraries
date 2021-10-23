using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic.F025
{
    [Serializable]
    public class TherapyPharm : PharmBase, IPeriod, IEntity, IEquatable<TherapyPharm>
    {
        [Key,ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        //[ColumnMap("order_id")]
        //public int? order_id { get; set; }

        [DisplayName("Дата записи"), ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [DisplayName("Дата начала приема"),ColumnMap("begin_date")]
        public DateTime begin_date { get; set; }

        [DisplayName("Дата окончания приема"),ColumnMap("end_date")]
        public DateTime? end_date { get; set; }

        [NotMapped]
        public bool is_medical_dosage { get { return !string.IsNullOrEmpty(medical_dosage); } }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as TherapyPharm);
        }

        public bool Equals(TherapyPharm other)
        {
            if (other == null) return false;

            if (ReferenceEquals(this, other))
                return true;
            if (id.Equals(other.id) && idm_employee.Equals(other.idm_employee)
                && idm_patient.Equals(other.idm_patient) && date_in.Equals(other.date_in)
                && order_id == null ? other.order_id == null : order_id.Equals(other.order_id)
                && begin_date.Equals(other.begin_date) && end_date.Equals(other.end_date)
                && is_cancel.Equals(other.is_cancel) && cancel_reason == other.cancel_reason
                && (string.IsNullOrEmpty(pharm_intake_schedule) ? string.IsNullOrEmpty(other.pharm_intake_schedule) : pharm_intake_schedule.Equals(other.pharm_intake_schedule)) 
                && (string.IsNullOrEmpty(pharm_name) ? string.IsNullOrEmpty(other.pharm_name) :  pharm_name.Equals(other.pharm_name))
                && (string.IsNullOrEmpty(medical_dosage) ? string.IsNullOrEmpty(other.medical_dosage) : medical_dosage.Equals(other.medical_dosage)))
                return true;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

    }

    public static class TherapyPharmExtension
    {
        public static void ClearLink(this TherapyPharm source)
        {
            source.id = -1;
            source.idm_employee = -1;
            source.idm_patient = -1;
            source.idm_task = -1;
        }

        public static TherapyPharm LinkTo(this TherapyPharm source,IProtocolView target, DateTime date_in)
        {
            return new TherapyPharm
            {
                id = 0,
                idm_task = target.idm_task,
                idm_employee = target.idm_employee,
                idm_patient = target.idm_patient,
                order_id = source.order_id,
                date_in = date_in,
                begin_date = DateTime.Now,
                pharm_name = source.pharm_name,
                pharm_intake_schedule = source.pharm_intake_schedule,
                medical_dosage = source.medical_dosage
            };
        }
    }
}
