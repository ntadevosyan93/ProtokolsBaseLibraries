namespace BaseLibraries.Abstractions.Models.iClinic
{
    public interface IPlace
    {
        int id { get; set; }
        string printOrganization { get; set; }
        string legalAdress { get; set; }
        string guid { get; set; }
        string inn { get; set; }
        string AdressProtocol { get; set; }
        string filialAdress { get; set; }
        string OnkoAdress { get; set; }
        string city { get; set; }
    }
}
