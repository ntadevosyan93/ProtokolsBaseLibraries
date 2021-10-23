using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaseLibraries.Models.iClinic.Views
{
    public class GystoServiceTemplateView
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_service")]
        public int idm_service { get; set; }

        [ColumnMap("idm_template")]
        public int idm_template { get; set; }

        [ColumnMap("service_name")]
        public string service_name { get; set; }

        [ColumnMap("template_name")]
        public string template_name { get; set; }

        public override string ToString()
        {
            return template_name;
        }
    }
}
