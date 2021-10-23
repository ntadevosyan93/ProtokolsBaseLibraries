using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    public enum HistoryCriteriaEnum
    {
        /// <summary>
        /// Жалобы
        /// </summary>
        Lament = 0,

        /// <summary>
        /// Анамнез
        /// </summary>
        Anamnesis = 1,

        /// <summary>
        /// Объективный статус
        /// </summary>
        Objective = 2,

        /// <summary>
        /// Локальный статус
        /// </summary>
        Localis = 3,

        /// <summary>
        /// Обоснование диагноза
        /// </summary>
        Justification = 4,

        /// <summary>
        /// Основное заболевание
        /// </summary>
        BaseDiagnosis = 5,

        /// <summary>
        /// Осложнения
        /// </summary>
        Complications = 6,

        /// <summary>
        /// Сопутствующее заболевание
        /// </summary>
        Sattelite = 7,


        /// <summary>
        /// Внешняя причина при травме
        /// </summary>
        OutClause = 8,
        
        /// <summary>
        /// Диета
        /// </summary>
        Diet = 9,
        
        /// <summary>
        /// Дообследование (текст)
        /// </summary>
        ManualRecommendation = 10,

        /// <summary>
        /// Консультации специалистов
        /// </summary>
        Consults = 11,

        /// <summary>
        /// Инструментальная диагностика
        /// </summary>
        Instrumental = 12,


        /// <summary>
        /// Лабораторная диагностика
        /// </summary>
        Lab = 13,

        /// <summary>
        /// Препараты
        /// </summary>
        Pharms = 14,

        /// <summary>
        /// Мед. процедуры
        /// </summary>
        MedicalProcedure = 15,


        /// <summary>
        /// Дополнительный комментарий врача
        /// </summary>
        Conclusion = 16

    }
}
