using BaseLibraries.Interfaces;

namespace BaseLibraries.Handlers
{
    public delegate void RepositoryActionHandler<TResult>() where TResult : IResult;
    
}
