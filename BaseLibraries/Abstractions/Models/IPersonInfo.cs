namespace BaseLibraries.Abstractions.Models
{
    public interface IPersonInfo
    {
        /// <summary>
        /// Место работы
        /// </summary>
        string job_place { get; set; }

        /// <summary>
        /// Основное место работы, совместитель
        /// </summary>
        bool is_main_job { get; set; }

        /// <summary>
        /// Должность
        /// </summary>
        string position { get; set; }

        /// <summary>
        /// контактный телефон
        /// </summary>
        string contact_phone { get; set; }
    }
}
