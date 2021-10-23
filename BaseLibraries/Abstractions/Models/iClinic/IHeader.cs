namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IHeader
    {
        int id { get; set; }

        string text { get; set; }

        byte[] blob { get; set; }

        string idm_1c { get; set; }

        string head { get; set; }
    }
}
