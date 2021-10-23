using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public class MedicalDosage
    {
        /// <summary>
        /// Дозировка (мл)
        /// </summary>
        public string Dosage { get; set; }

        /// <summary>
        /// Режим (кол-во в день)
        /// </summary>
        public string Mode { get; set; }

        /// <summary>
        /// Длительность - дней
        /// </summary>
        public string Lenght { get; set; }

        /// <summary>
        /// Способ введения (в\м ... и.т.п.)
        /// </summary>
        public string Method { get; set; }

        public override string ToString()
        {
            return Dosage + " мл.\\" + Mode + " р.д\\" + Lenght + " д. (" + Method+")";
        }
    }
}
