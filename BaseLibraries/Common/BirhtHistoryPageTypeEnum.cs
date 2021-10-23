using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Common
{
    /// <summary>
    /// Тип листа истории родов
    /// </summary>
    public enum BirhtHistoryPageType : byte
    {
        /// <summary>
        /// Титульная страница
        /// </summary>
        [Description("Осмотр при поступлении")]
        GetUp = 0,

        /// <summary>
        /// Предродовой период 
        /// </summary>
        [Description("Предродовой период (ВМИ)")]
        PrenatalPeriod = 10,


        [Description("Предродовой период (без ВМИ)")]
        PrenatalPeriodWithOutVMI = 15,

        /// <summary>
        /// Роды
        /// </summary>
        [Description("Роды")]
        Childbirth = 20,
        
        /// <summary>
        /// Послеродовой период
        /// </summary>
        [Description("Послеродовой период")]
        PostpartumPeriod = 30,

        /// <summary>
        /// Выписка
        /// </summary>
        [Description("Выписка (эпикриз)")]
        DropOut =  40,

        [Description("Лекарственные назначения")]
        PharmList = 50
    }
}
