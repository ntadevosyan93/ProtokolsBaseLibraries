using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic.F025
{
    public class PatientMetric : IEquatable<PatientMetric>
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [DisplayName("Дата"),ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [DisplayName("t-тела"),ColumnMap("temperature")]
        public double? temperature { get; set; }

        [DisplayName("Масса тела"),ColumnMap("weight")]
        public byte? weight { get; set; }

        [DisplayName("Рост"),ColumnMap("height")]
        public byte? height { get; set; }

        [DisplayName("ЧД"),ColumnMap("ch_d")]
        public byte? ch_d { get; set; }

        [DisplayName("ЧСС"),ColumnMap("ch_ss")]
        public byte? ch_ss { get; set; }

        [DisplayName("АД"),ColumnMap("ad")]
        public string ad { get; set; }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as PatientMetric);
        }

        public bool Equals(PatientMetric other)
        {
            if (other == null) return false;

            if (ReferenceEquals(this, other))
                return true;

            if (id.Equals(other.id) && idm_patient.Equals(other.idm_patient) 
                && date_in.Equals(other.date_in) && temperature.Equals(other.temperature)
                && weight.Equals(other.weight) && height.Equals(other.height)
                && ch_d.Equals(other.ch_d) && ch_ss.Equals(other.ch_ss)
                && ad.Equals(other.ad))
                return true;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
