using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum EmployeeEnum:int
    {
        [Description("Кичкина 2")]
        Kichkina =2,

        [Description("Волков 70 ")]
        Volkov = 70,

        [Description("Капирулин 1393")]
        Kapirulin = 1393,

        [Description("Шонэ 1055")]
        SHono= 1055,

        [Description("Новокрещенова 2703")]
        Novokreshchenova = 2703,

        [Description("Сибиряков 1745")]
        Sibiryakov = 1745

    }
}
