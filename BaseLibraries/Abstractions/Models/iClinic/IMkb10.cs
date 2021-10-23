namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IMkb10 : IEntity
    {
        string sort { get; set; }
        string code { get; set; }
        string name { get; set; }
        int? parent_id { get; set; }
        string full_name { get; }
    }
}
