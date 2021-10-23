namespace BaseLibraries.Models.iClinic
{
    public class GystoServiceTemplate
    {
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_service")]
        public int idm_service { get; set; }

        [ColumnMap("idm_template")]
        public int idm_template { get; set; }
    }
}
