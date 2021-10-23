using BaseLibraries.Abstractions.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class EmployeeTemplatePharm : IEntity, IEquatable<EmployeeTemplatePharm>
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_mkb10")]
        public int? idm_mkb10 { get; set; }

        [ColumnMap("name")]
        public string name { get; set; }

        [ColumnMap("json_data")]
        public string json_data { get; set; }

        [ColumnMap("sort_idx")]
        public int? sort_idx { get; set; }

        public bool Equals(EmployeeTemplatePharm other)
        {
            if(other == null) return false;

            if (ReferenceEquals(this, other))
                return true;

            if (id.Equals(other.id) && idm_employee.Equals(other.idm_employee)
                && (idm_mkb10.HasValue ? idm_mkb10.Equals(other.idm_mkb10) : !other.idm_mkb10.HasValue)
                && (sort_idx.HasValue ? sort_idx.Equals(other.sort_idx) : !other.sort_idx.HasValue)
                && (string.IsNullOrEmpty(name) ? string.IsNullOrEmpty(other.name) : name.Equals(other.name))
                && (string.IsNullOrEmpty(json_data) ? string.IsNullOrEmpty(other.json_data) : json_data.Equals(other.json_data)))
                return true;
            else
                return false;
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as EmployeeTemplatePharm);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
