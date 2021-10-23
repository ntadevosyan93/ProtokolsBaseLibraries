using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.iClinic
{
    public class ICLINIC_SCHEDULE_DOCTORS
    {

        public int id { get; set; }


        public DateTime? date_in { get; set; }


        public string user_in { get; set; }


        public int? idm_employee { get; set; }


        public DateTime? date_start { get; set; }

        public DateTime? date_stop { get; set; }

        public int? idm_place { get; set; }

        public short? time_interval { get; set; }

        public string idm_1c { get; set; }


        public short? zapis_type { get; set; }


        public byte? consistently { get; set; }


        public int? idm_cabinet { get; set; }


        public byte? del { get; set; }
    }
}
