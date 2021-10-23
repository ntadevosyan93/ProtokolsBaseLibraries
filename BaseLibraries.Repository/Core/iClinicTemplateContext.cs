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
    public class iClinicTemplateContext : ClinicContext
    {
        public string UserName { get; set; }


        public iClinicTemplateContext() : base()
        {
            Database.Connection.ConnectionString = ConfigurationManager.ConnectionStrings["iClinicConnectionString"].ToString();

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {


            Database.SetInitializer<iClinicTemplateContext>(null);

            base.OnModelCreating(modelBuilder);

        }
    }
}
