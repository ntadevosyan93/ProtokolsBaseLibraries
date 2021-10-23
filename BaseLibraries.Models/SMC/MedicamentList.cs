using BaseLibraries.Abstractions.Models;

namespace BaseLibraries.Models.SMC
{
    /// <summary>
    /// Справочник медикаментов
    /// </summary>
    public class Medicament : IEntity
    {
        public int id { get; set; }
        /// <summary>
        /// Фарм группа
        /// </summary>
        public string pharm_group { get; set; }

        /// <summary>
        /// Анатомо-терапевтическо-химическая классификация
        /// </summary>
        public string atx { get; set; }

        /// <summary>
        /// Международное непатентованное наименование
        /// </summary>
        public string mnn { get; set; }

        public override string ToString()
        {
            return mnn;
        }
    }
}
