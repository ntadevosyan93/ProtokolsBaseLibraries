using BaseLibraries.Common;
using Newtonsoft.Json;
using System;

namespace BaseLibraries.Abstractions.Models
{
    public interface IDiagnosis : IEntity
    {
        int idm_task { get; set; }
        int idm_mkb10 { get; set; }
        int idm_employee { get; set; }
        int idm_patient { get; set; }
        int? order_id { get; set; }
        DiagnosisTypes type { get; set; }
        DiagnosisProof proof_type { get; set; }

        DateTime date_in { get; set; }
        string description { get; set; }
    }
}
