using BaseLibraries.Common;
using Clinic.Development;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class TaskDocument: IEquatable<TaskDocument>
    {
        [Key, ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_patient")]
        public int? idm_patient { get; set; }

        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        [ColumnMap("lament"), DisplayName("Жалобы")]
        public string lament { get; set; }

        [ColumnMap("anamnez"), DisplayName("Анамнез")]
        public string anamnez { get; set; }

        [ColumnMap("objective"), DisplayName("Объективные статус")]
        public string objective { get; set; }

        [Column("localis"),DisplayName("Локальный статус")]
        public string localis { get; set; }

        [ColumnMap("diagnoze"),DisplayName("Диагноз")]
        public string diagnoze { get; set; }

        [ColumnMap("assignments"),DisplayName("Лечение")]
        public string assignments { get; set; }
        
        [ColumnMap("complications"),DisplayName("Осложнения")]
        public string complications { get; set; }

        [ColumnMap("conclusion"),DisplayName("Заключение")]
        public string conclusion { get; set; }

        [ColumnMap("justification_diag"),DisplayName("Обоснование диагноза")]
        public string justification_diag { get; set; }

        [ColumnMap("quality")]
        public int quality { get; set; }

        [ColumnMap("visiting_epidemic_regions"), DisplayName("Эпидемиологический анамнез")]
        public bool visiting_epidemic_regions { get; set; }

        [ColumnMap("epidemic_mode"),DisplayName("Соблюдение режима")]
        public EpidemicMode epidemic_mode { get; set; }

        [ColumnMap("epidemic_mode"), DisplayName("Соблюдает карантин")]
        public bool covid_crt { get; set; }

        [ColumnMap("covid_enbl"), DisplayName("Подверждает наличие COVID")]
        public bool covid_enbl { get; set; }

        // AVA 17.09.2020 
        [ColumnMap("IsCovid_ContactWithAssume"), DisplayName("Контакт с подозрительными на Covid")]
        public bool IsCovid_ContactWithAssume { get; set; }

        [ColumnMap("IsCovid_ContactWithConfirmation"), DisplayName("Контакт с подтверждённым Covid")]
        public bool IsCovid_ContactWithConfirmation { get; set; }


        [NotMapped]
        public bool IsEmpty {
            get
            {
                return (string.IsNullOrEmpty(lament)
                    && string.IsNullOrEmpty(anamnez)
                    && string.IsNullOrEmpty(objective)
                    && string.IsNullOrEmpty(conclusion)
                    && string.IsNullOrEmpty(complications)) ? true : false;
            }
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as TaskDocument);
        }

        public bool Equals(TaskDocument other)
        {
            if (other == null) return false;

            if (ReferenceEquals(this, other))
                return true;
            try
            {
                if (id.Equals(other.id) && idm_employee.Equals(other.idm_employee)
                    && covid_crt.Equals(other.covid_crt)
                    && covid_enbl.Equals(other.covid_enbl)
                    && epidemic_mode.Equals(other.epidemic_mode)
                    && visiting_epidemic_regions.Equals(other.visiting_epidemic_regions)
                    && idm_patient.Equals(other.idm_patient)
                    && (string.IsNullOrEmpty(lament) ? string.IsNullOrEmpty(other.lament) : lament.Equals(other.lament))
                    && (string.IsNullOrEmpty(anamnez) ? string.IsNullOrEmpty(other.anamnez) : anamnez.Equals(other.anamnez))
                    && (string.IsNullOrEmpty(objective) ? string.IsNullOrEmpty(other.objective) : objective.Equals(other.objective))
                    && (string.IsNullOrEmpty(assignments) ? string.IsNullOrEmpty(other.assignments) : assignments.Equals(other.assignments))
                    && (string.IsNullOrEmpty(complications) ? string.IsNullOrEmpty(other.complications) : complications.Equals(other.complications))
                    && (string.IsNullOrEmpty(conclusion) ? string.IsNullOrEmpty(other.conclusion) : conclusion.Equals(other.conclusion)))
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                return false;
            }
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
