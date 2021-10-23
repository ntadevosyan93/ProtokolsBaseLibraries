using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    [Serializable]
    public class PatientDiagnoses : IDiagnosis
    {
        [Key,ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_mkb10")]
        public int idm_mkb10 { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("order_id")]
        public int? order_id { get; set; }

        [ColumnMap("type")]
        public DiagnosisTypes type { get; set; }

        [ColumnMap("proof_type")]
        public DiagnosisProof proof_type { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("description")]
        public string description { get; set; }

    }

    public static class PatientDiagnosesExtension
    {
        public static void ClearLink(this IDiagnosis source)
        {
            source.id = -1;
            source.idm_employee = -1;
            source.idm_patient = -1;
            source.idm_task = -1;
        }

        public static PatientDiagnoses LinkTo(this IDiagnosis source, IProtocolView target, DateTime date_in)
        {
            return new PatientDiagnoses
            {
                id = 0,
                idm_task = target.idm_task,
                idm_employee = target.idm_employee,
                idm_patient = target.idm_patient,
                idm_mkb10 = source.idm_mkb10,
                order_id = source.order_id,
                type = source.type,
                description = source.description,
                date_in = date_in
            };
        }
    }
}
