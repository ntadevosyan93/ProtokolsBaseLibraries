using BaseLibraries.EnitityContext.BaseTypes;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.Models.MedicalAnalyzer;

namespace BaseLibraries.EnitityContext
{
    public class MedicalAnalyzerContext : DbContext
    {
        public MedicalAnalyzerContext():base("Data Source=192.168.17.4;Initial Catalog=MedicalAnalyzers;Persist Security Info=True;User ID=sa;Password=@WSX2wsx")
        {
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            DbInterception.Add(new NoLockInterceptor());
            Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<Tasks> Tasks { get; set; }
        public DbSet<TasksFlag> TasksFlag { get; set; }
        public DbSet<Analyzer> Analyzers { get; set; }
        public DbSet<Tube> Tubes { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");
            modelBuilder.Entity<Tasks>().ToTable("TASKS");
            modelBuilder.Entity<TasksFlag>().ToTable("TASKS_FLAG");
            modelBuilder.Entity<Analyzer>().ToTable("ANALYZER");
        }

        private void FixEfProviderServicesProblem()
        {
            var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }
    }


}
