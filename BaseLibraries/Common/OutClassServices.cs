using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Услуга в не стандартном классе (типа ремаппинг)
    /// </summary>
    public class OutClassService
    {
        public int idm_service { get; set; }
        public ServiceTypeEnum type { get; set; }
    }
}
