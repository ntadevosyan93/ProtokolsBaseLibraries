using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MedicalAnalyzer.Views
{
    public class GlukozeDiagram
    {
        public int id { get; set; }
        public int vTaskAn_biomat { get; set; }
        public decimal res_value_num { get; set; }
        public string text { get; set; }
        public int idm_tasks { get; set; }
        public string analysis_t { get; set; }
    }
}
