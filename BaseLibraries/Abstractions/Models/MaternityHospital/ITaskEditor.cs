using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models.MaternityHospital
{
    /// <summary>
    /// Титульная страница истории родов
    /// </summary>
    public interface ITaskEditor
    {
        string dog_num { get; set; }

        string from_doctor { get; set; }

        string address_live { get; set; }

        MaritalStatus marital { get; set; }

        string job_place { get; set; }

        bool visiting_doc_pregancy { get; set; }

        string diag_delivery { get; set; }

        string diag_clinical { get; set; }

        string diag_final { get; set; }

        string birth_complications { get; set; }

        BithDroppedOut dropped_out_result { get; set; }

    }
}
