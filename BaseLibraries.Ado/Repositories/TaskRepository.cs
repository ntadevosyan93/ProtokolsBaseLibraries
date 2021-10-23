using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BaseLibraries.Interfaces;
using BaseLibraries.Models.iClinic;
using BaseLibraries.Ado.Helpers;
using System.Data.SqlClient;

namespace BaseLibraries.Ado.Repositories
{
    public class TaskRepository : IRepository<Tasks>
    {
        string _connection = "";
        public void Add(Tasks entity)
        {
            var cmd = new SqlCommand();
            var dadatat = cmd.ExecuteReader<Tasks>(_connection);

            throw new NotImplementedException();
        }

        public void Delete(Tasks entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Tasks> Get(Func<bool, Tasks> func)
        {
            throw new NotImplementedException();
        }

        public void Sync()
        {
            throw new NotImplementedException();
        }

        public void Update(Tasks entity)
        {
            throw new NotImplementedException();
        }
    }
}
