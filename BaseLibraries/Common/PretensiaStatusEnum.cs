using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common.Enum
{
    //tt_trouble_status_pretensia
    public enum PretensiaStatusEnum :int
    {
        [Description("Ошибочный/повторный инцидент")]
        OshibochnyjPovtornyjIncident = 8,
        [Description("Инцидент завершён")]
        Razreshen=4,
        [Description("Новый инцидент")]
        New = 1,
        [Description("Ждет отправки/публикации")]
        ZHdet=9
    }
}
