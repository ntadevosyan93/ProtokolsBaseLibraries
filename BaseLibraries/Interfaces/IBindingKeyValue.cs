namespace BaseLibraries.Interfaces
{
    public interface IBindingKeyValue
    {
        string BindingName { get; set; }

        bool IsComplexTemplate { get; set; }

        string Caption { get; set; }
    }
}
