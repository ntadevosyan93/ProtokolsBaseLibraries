using BaseLibraries.EnitityContext;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Core
{
    public class TemplateContext : InformContext
    {
        public TemplateContext() : base()
        {
            Database.Connection.ConnectionString = ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ToString();

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {


            Database.SetInitializer<TemplateContext>(null);

            base.OnModelCreating(modelBuilder);

        }
    }

}
