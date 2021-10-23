using System;

namespace BaseLibraries.Common
{
    [Serializable]
    public class RtfBindData
    {
        /// <summary>
        /// Жалобы
        /// </summary>
        [BindName(nameof(Lament)),ColumnMap(nameof(Lament),"Жалобы",1,true)]
        public string Lament { get; set; }

        /// <summary>
        /// Анамнез заболевания
        /// </summary>
        [BindName(nameof(Anamnez)),ColumnMap(nameof(Anamnez), "Аnamnesis morbi", 2,true)]
        public string Anamnez { get; set; }

        /// <summary>
        /// Объективный статус
        /// </summary>
        [BindName(nameof(Objective)), ColumnMap(nameof(Objective), "Status praesens", 3,true)]
        public string Objective { get; set; }

        /// <summary>
        /// Локальный статус
        /// </summary>
        [BindName(nameof(Localis)),ColumnMap(nameof(Localis), "Status localis",4,true)]
        public string Localis { get; set; }

        /// <summary>
        /// Осложнения
        /// </summary>
        [BindName(nameof(Complications))]
        public string Complications { get; set; }

        /// <summary>
        /// Заключение (Дополнительные коментарии врача)
        /// </summary>
        [BindName(nameof(Conclusion))]
        public string Conclusion { get; set; }

        /// <summary>
        /// Обоснование диагноза
        /// </summary>
        [BindName(nameof(JustificationDiagnosis))]
        public string JustificationDiagnosis { get; set; }

    }
}
