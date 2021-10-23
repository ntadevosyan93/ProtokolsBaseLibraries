using System;
using System.Linq;

namespace BaseLibraries.Interfaces
{
    public interface IRepository
    {
        void Sync();
    }

    public interface IRepository<T> : IRepository where T : class
    {
        IQueryable<T> Get(Func<bool, T> func);
        void Add(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
