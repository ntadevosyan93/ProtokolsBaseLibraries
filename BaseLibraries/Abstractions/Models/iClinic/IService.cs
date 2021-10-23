namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IService : IEntity
    {
        int? id_parent { get; set; }
        string text { get; set; }
        int? idm_spec { get; set; }
        string Code { get; set; }
    }
}
