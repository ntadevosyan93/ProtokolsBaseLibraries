using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.PriceSRV
{
    public enum CriteriaType : byte
    {
        /// <summary>
        /// Только для филиала
        /// </summary>
        Filial = 0,

        /// <summary>
        /// Посещение определеного врача
        /// </summary>
        Employee = 1,

        /// <summary>
        /// Определенному пациенту
        /// </summary>
        Patient = 2,

        /// <summary>
        /// Инструментальная диагнотика
        /// </summary>
        Service = 3,

    }

    public enum RuleType : byte
    {
        /// <summary>
        /// Объеденяющее правило
        /// </summary>
        And = 0,

        /// <summary>
        /// Любое из
        /// </summary>
        Or = 1,

        /// <summary>
        /// Исключающее
        /// </summary>
        Not = 2
    }

    public enum MathDirection : byte
    {
        /// <summary>
        /// Уменьшение
        /// </summary>
        Down = 0,

        /// <summary>
        /// Увеличение
        /// </summary>
        Up = 1
    }



    public enum Denominator : byte
    {
        /// <summary>
        /// Процент
        /// </summary>
        Persentage = 0,

        /// <summary>
        /// Фиксированная стоимость
        /// </summary>
        FixPrice = 1,

        /// <summary>
        /// Бесплатно
        /// </summary>
        Zero = 2
    }
}
