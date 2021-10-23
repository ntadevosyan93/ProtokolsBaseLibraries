namespace BaseLibraries.Interfaces
{
    public interface IFieldToControl<T> where T : class, IControlSpecification<T>
    {
        IDocumentField DocumentField { get;  }
        IControlSpecification<T> Specification { get;  }
        bool IsBound { get; set; }
    }
}
