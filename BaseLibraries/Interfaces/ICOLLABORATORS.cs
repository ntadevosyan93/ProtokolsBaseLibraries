using System;
using DevExpress.Xpo;

namespace BaseLibraries.Interfaces
{

    public interface ICOLLABORATORS :ICreate
    {
         
         int? idm_isp_coll { get; set; }
         
         int? idm_main { get; set; }
    }

}