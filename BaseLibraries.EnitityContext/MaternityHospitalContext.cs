using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Linq;
using System.Text;

using BaseLibraries.EnitityContext.BaseTypes;
using BaseLibraries.EnitityContext.Behaviors;
using BaseLibraries.Models.MaternityHospital;
using BaseLibraries.Models.MaternityHospital.Views;

namespace BaseLibraries.EnitityContext
{
    public class MaternityHospitalContext : DbContext
    {
        public MaternityHospitalContext() : base("Data Source=sql2.vipcg.ru;Initial Catalog=MaternityHospital;Persist Security Info=True;User ID=sa;Password=YbxK75K%me")
        {
            Database.SetInitializer<MaternityHospitalContext>(null);
            //DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
        }

        public DbSet<Services> ServiceList { get; set; }

        public DbSet<Patient> PatientList { get; set; }

        public DbSet<Task> TaskList { get; set; }

        public DbSet<TaskPage> TaskPages { get; set; }

        public DbSet<Employee> EmployeList { get; set; }

        public DbSet<View_TaskList> View_TaskList { get; set;}

        public DbSet<View_TaskPage> View_TaskPage { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new viewTaskListConfiguration());
            modelBuilder.Configurations.Add(new viewTaskPageConfiguration());

            base.OnModelCreating(modelBuilder);
        }
    }
}
