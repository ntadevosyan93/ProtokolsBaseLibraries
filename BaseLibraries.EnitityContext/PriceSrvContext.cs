using BaseLibraries.EnitityContext.BaseTypes;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.Models.PriceSRV;

namespace BaseLibraries.EnitityContext
{
    public class PriceSrvContext : DbContext
    {
        public PriceSrvContext() : base("Data Source=192.168.17.4;Initial Catalog=PriceSRV;Persist Security Info=True;User ID=sa;Password=@WSX2wsx")
        {
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<DiscountList> DiscountLists { get; set; }
        public DbSet<DiscountFilial> DiscountFilials { get; set; }
        public DbSet<DiscountEmployee> DiscountEmployees { get; set; }
        public DbSet<DiscountPatient> DiscountPatients { get; set; }
        public DbSet<DiscountServices> DiscountServices { get; set; }
        public DbSet<DiscountRule> DiscountRules { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");

            modelBuilder.Entity<DiscountList>().ToTable("DISCOUNT_LIST");
            modelBuilder.Entity<DiscountEmployee>().ToTable("DISCOUNT_EMPLOYEE");
            modelBuilder.Entity<DiscountFilial>().ToTable("DISCOUNT_FILIAL");
            modelBuilder.Entity<DiscountPatient>().ToTable("DISCOUNT_PATIENT");
            modelBuilder.Entity<DiscountServices>().ToTable("DISCOUNT_SERVICE");
            modelBuilder.Entity<DiscountRule>().ToTable("DISCOUNT_RULE");
        }
    }
}
