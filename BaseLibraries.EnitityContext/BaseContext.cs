using BaseLibraries.EnitityContext.BaseTypes;
using BaseLibraries.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.EnitityContext
{
    public class BaseContext : DbContext
    {
        public BaseContext() : base()
        {
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            Configuration.LazyLoadingEnabled = false;
        }

        public string UserName { get; set; }
        

        public override int SaveChanges()
        {
            var i_change = ChangeTracker.Entries<IModify>();
            if (i_change != null)
            {

                DateTime this_time = DateTime.Now;
                foreach (var entry in i_change.Where(c => c.State != EntityState.Unchanged))
                {
                    if (entry.Entity.id != 0)
                    { 
                        entry.Entity.date_cur = this_time;
                        entry.Entity.user_cur = UserName;
                    }
                }

            }


            var i_create = ChangeTracker.Entries<ICreate>();
            if (i_create != null)
            {
                DateTime this_time = DateTime.Now;
                foreach (var entry in i_create.Where(c => c.State != EntityState.Unchanged))
                {

                    if (entry.Entity.id == 0)
                    {
                        entry.Entity.date_in = this_time;

                        entry.Entity.user_in = UserName;

                    }
                }
            }
        


            var i_del = ChangeTracker.Entries<IDel>();
            if (i_del != null)
            {
                foreach (var entry in i_del.Where(c => c.State != System.Data.Entity.EntityState.Unchanged))
                {
                    if (entry.Entity.id == 0)
                    {
                        entry.Entity.del = false;
                    }
                }
            }
            //return 0;
            return base.SaveChanges();


        }
    }
}
