using BaseLibraries.Common;
using System;

namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IRecommendation
    {
        int idm_task { get; set; }
        int idm_employee { get; set; }
        int idm_patient { get; set; }
        int? idm_service { get; set; }
        int? order_id { get; set; }
        DateTime? date_in { get; set; }
        RecommendationType type { get; set; }
        string description { get; set; }
        string Comment { get; set; }
    }
}
