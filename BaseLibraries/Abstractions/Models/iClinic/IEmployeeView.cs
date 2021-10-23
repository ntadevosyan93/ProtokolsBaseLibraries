namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IEmployeeView : IEntity
    {
        string fio { get; set; }
        string guid { get; set; }
    }
}
