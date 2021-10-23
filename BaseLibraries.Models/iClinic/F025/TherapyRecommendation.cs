using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic.F025
{
    [Serializable]
    public class TherapyRecommendation : IEntity, IRecommendation, IEquatable<TherapyRecommendation>
    {
        [Key,ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("idm_service")]
        public int? idm_service { get; set; }

        [ColumnMap("order_id")]
        public int? order_id { get; set; }

        [DisplayName("Вид рекомендации"),ColumnMap("type")]
        public RecommendationType type { get; set; }

        [DisplayName("Дата записи"), ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [DisplayName("Дата начала"), ColumnMap("begin_date")]
        public DateTime? begin_date { get; set; }

        [DisplayName("Дата окончания"), ColumnMap("end_date")]
        public DateTime? end_date { get; set; }

        [DisplayName("Описание"),ColumnMap("description")]
        public string description { get; set; }

        [DisplayName("Комментарий"), ColumnMap("Comment")]
        public string Comment { get; set; }
        
        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as TherapyRecommendation);
        }

        public bool Equals(TherapyRecommendation other)
        {
            if (other == null) return false;

            if (ReferenceEquals(this, other))
                return true;

            if (id.Equals(other.id) && idm_employee.Equals(other.idm_employee)
                && idm_patient.Equals(other.idm_patient) && idm_service.Equals(other.idm_service)
                && order_id == null ? other.order_id == null : order_id.Equals(other.order_id)
                && type.Equals(other.type) && date_in.Equals(other.date_in)
                && begin_date.Equals(other.begin_date) && end_date.Equals(other.end_date)
                && (string.IsNullOrEmpty(description) == string.IsNullOrEmpty(other.description))
                && (string.IsNullOrEmpty(Comment) == string.IsNullOrEmpty(other.Comment)))
            {
                return description == other.description;
            }
            else
            {
                return false;
            }
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }

    public static class TherapyRecommendationExtension
    {
        public static void ClearLink(this TherapyRecommendation source)
        {
            source.id = -1;
            source.idm_employee = -1;
            source.idm_patient = -1;
            source.idm_task = -1;
            source.date_in = null;
            source.begin_date = null;
            source.end_date = null;
        }

        public static TherapyRecommendation LinkTo(this TherapyRecommendation source, IProtocolView target,DateTime date_in)
        {
            return new TherapyRecommendation
            {
                id = 0,
                idm_task = target.idm_task,
                idm_employee = target.idm_employee,
                idm_patient = target.idm_patient,
                order_id = source.order_id,
                date_in = date_in,
                begin_date = DateTime.Now,
                idm_service = source.idm_service,
                type = source.type,
                description = source.description,
                Comment = source.Comment
            };
        }
    }
}
