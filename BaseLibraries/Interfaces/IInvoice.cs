using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{
    public interface IInvoice
    {
        int id { get; set; }

        int? idm_billing { get; set; }

        int? idm_type { get; set; }

        string invoice_number { get; set; }

        DateTime? invoice_date { get; set; }
    }
}
