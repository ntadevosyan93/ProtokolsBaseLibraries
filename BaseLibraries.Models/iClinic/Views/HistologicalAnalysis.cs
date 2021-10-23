using System;

namespace BaseLibraries.Models.iClinic.Views
{
    public class HistologicalAnalysis
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("guid")]
        public string guid { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_patient")]
        public int? idm_patient { get; set; }

        //[ColumnMap("saveBox_value","Отметка о сохранности упаковки",1)]
        //public string saveBox_value { get; set; }

        [ColumnMap("reg_number", "Регистрационный номер", 2)]
        public string reg_number { get; set; }

        [ColumnMap("histol_services", "Оказанные услуги", 3)]
        public string histol_services { get; set; }

        [ColumnMap("histol_service_type_value", "Категория сложности", 4)]
        public string histol_service_type_value { get; set; }

        [ColumnMap("date_sampling", "Вырезка проводилась", 5)]
        public DateTime? date_sampling { get; set; }

        [ColumnMap("count_piece", "В проводку взято кусочков", 5)]
        public int? count_piece { get; set; }

        [ColumnMap("count_bloc", "Блоков", 6)]
        public int? count_bloc { get; set; }

        [ColumnMap("color_text", "Назначенные окраски (реакции,определения)", 7)]
        public string color_text { get; set; }

        [ColumnMap("macro_text", "Макроскопическое описание", 8)]
        public string macro_text { get; set; }

        [ColumnMap("micro_text", "Микроскопическое описание", 9)]
        public string micro_text { get; set; }

        [ColumnMap("result_text", "Заключение", 10)]
        public string result_text { get; set; }

        [ColumnMap("empl_doc", "Врач-патологоанатом", 10)]
        public string empl_doc { get; set; }

        [ColumnMap("empl_consult", "Врач, осуществляющий консультирование", 11)]
        public string empl_consult { get; set; }

        [ColumnMap("date_protocol", "Дата проведения прижизненного патолого-анатомического исследования", 12)]
        public DateTime? date_protocol { get; set; }

        [ColumnMap("user_cur")]
        public string user_cur { get; set; }

        [ColumnMap("date_cur")]
        public DateTime? date_cur { get; set; }

        [ColumnMap("del")]
        public byte? del { get; set; }

        [ColumnMap("status")]
        public byte? status { get; set; }

        [ColumnMap("idm_services")]
        public int? idm_services { get; set; }

        [ColumnMap("isFixed")]
        public bool isFixed { get; set; }
    }
}
