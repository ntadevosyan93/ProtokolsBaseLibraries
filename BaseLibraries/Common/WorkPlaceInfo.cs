using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public class WorkPlaceInfo
    {
        /// <summary>
        /// Имя компьютера
        /// </summary>
        public string CompName { get; set; }

        /// <summary>
        /// IP адрес
        /// </summary>
        public string IP { get; set; }

        /// <summary>
        /// Наименование программы
        /// </summary>
        public string ProgName { get; set; }

        /// <summary>
        /// Версия программы
        /// </summary>
        public string Version { get; set; }

        public override string ToString()
        {
            return ProgName + " " + Version;
        }
    }
}
