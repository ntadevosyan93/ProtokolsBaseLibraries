using BaseLibraries.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models
{
    public interface IPatientInfo : IEntity, IPersonInfo
    {
        /// <summary>
        /// Код категории льгот (категория, документ, серия и номер)
        /// </summary>
        string benefits_category { get; set; }

        /// <summary>
        /// Полис ОМС 
        /// </summary>
        string oms_police { get; set; }

        /// <summary>
        /// СНИЛС
        /// </summary>
        string snils { get; set; }

        /// <summary>
        /// Наименование страховой организации
        /// </summary>
        string insurance_org { get; set; }

        /// <summary>
        /// Семейные отношения
        /// </summary>
        MaritalStatus marital_status { get; set; }

        /// <summary>
        /// Образование
        /// </summary>
        Education education { get; set; }

        /// <summary>
        /// Занятость
        /// </summary>
        Employment employment { get; set; }

        /// <summary>
        /// Инвалидность (первичная, повторная, группа, дата)
        /// </summary>
        string disability { get; set; }

        /// <summary>
        /// Группа крови
        /// </summary>
        BloodType blood_type { get; set; }

        /// <summary>
        /// Rh - фактор
        /// </summary>
        string rh_factor { get; set; }


        /// <summary>
        /// Аллергические реакции 
        /// </summary>
        string allergic_reactions { get; set; }


        /// <summary>
        /// Анамнез жизни
        /// </summary>
        string anamnesis_life { get; set; }

        /// <summary>
        /// Заметки по пациенту
        /// </summary>
        string notes { get; set; }
    }
}
