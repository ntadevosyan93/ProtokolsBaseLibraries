namespace BaseLibraries.Models.iClinic.Views
{
    public class TemplateView
    {
        [ColumnMap("Id")]
        public int Id { get; set; }

        [ColumnMap("RootID")]
        public int RootID { get; set; }

        [ColumnMap("Name")]
        public string Name { get; set; }

        [ColumnMap("ServiceName")]
        public string ServiceName { get; set; }

        [ColumnMap("EmployeeFio")]
        public string EmployeeFio { get; set; }

        [ColumnMap("ServiceRootID")]
        public int? ServiceRootID { get; set; }

        [ColumnMap("ServiceID")]
        public int? ServiceID { get; set; }

        [ColumnMap("ServiceIdm1c")]
        public string ServiceIdm1c { get; set; }

        [ColumnMap("EmployeeID")]
        public int? EmployeeID { get; set; }

        [ColumnMap("EmployeeIdm1c")]
        public string EmployeeIdm1c { get; set; }

        [ColumnMap("Ver")]
        public byte Ver { get; set; }

        [ColumnMap("IsDefault")]
        public bool IsDefault { get; set; }

        [ColumnMap("HasField")]
        public bool HasField { get; set; }

        [ColumnMap("HasMap")]
        public bool HasMap { get; set; }
    }

}
