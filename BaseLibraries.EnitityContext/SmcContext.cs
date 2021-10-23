using BaseLibraries.EnitityContext.BaseTypes;
using BaseLibraries.Models.SMC;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;

namespace BaseLibraries.EnitityContext
{
    public class SmcContext : DbContext
    {
        public SmcContext() : base("Data Source=sql2.vipcg.ru;Initial Catalog=SMC;Persist Security Info=True;User ID=sa;Password=YbxK75K%me")
        {
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<Standart> StandarstList { get; set; }
        public DbSet<Mkb> MkbList { get; set; }
        public DbSet<Medicament> MedicamentList { get; set; }
        public DbSet<Services> ServicesList { get; set; }

        public DbSet<PatientModel> PatientModels { get; set; }
        public DbSet<PmMedical> PmMedicals { get; set; }
        public DbSet<PmNosology> PmNosologies { get; set; }
        public DbSet<PmServices> PmServices { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Standart>().Property(x => x.order_date).IsOptional();
            modelBuilder.Entity<Standart>().Property(x => x.is_actual).IsOptional();
            modelBuilder.Entity<Standart>().Property(x => x.phase).IsOptional();
            modelBuilder.Entity<Standart>().Property(x => x.stage).IsOptional();
            modelBuilder.Entity<Standart>().Property(x => x.phase).IsOptional();
            modelBuilder.Entity<Standart>().Property(x => x.terms_of_assistance).IsOptional();

            modelBuilder.Entity<Mkb>().Property(x => x.date_cor).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<Mkb>().Property(x => x.parent_id).IsOptional();

            modelBuilder.Entity<Services>().Property(x => x.date_end).HasColumnType("datetime").IsOptional();
        }
    }
}
