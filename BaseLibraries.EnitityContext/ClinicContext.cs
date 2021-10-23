using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using BaseLibraries.Models.iClinic;
using BaseLibraries.Models.iClinic.F025;
using BaseLibraries.EnitityContext.BaseTypes;
using System.Data.Entity.Infrastructure;

namespace BaseLibraries.EnitityContext
{
    public class ClinicContext : DbContext
    {
        public ClinicContext() : base("Data Source=192.168.17.4;Initial Catalog=iClinic;Persist Security Info=True;User ID=sa;Password=@WSX2wsx; Connection Timeout=30000")
        {
            this.Database.CommandTimeout = 300;
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            DbInterception.Add(new NoLockInterceptor());
            Configuration.LazyLoadingEnabled = false;
        }

        public ClinicContext(bool lazyLoading) : base("Data Source=192.168.17.4;Initial Catalog=iClinic;Persist Security Info=True;User ID=sa;Password=@WSX2wsx; Connection Timeout=30000")
        {
            this.Database.CommandTimeout = 300;
            DbInterception.Add(new IsolationLevelInterceptor(System.Data.IsolationLevel.ReadUncommitted));
            DbInterception.Add(new NoLockInterceptor());
            Configuration.LazyLoadingEnabled = lazyLoading;
        }

        public DbSet<APPLICATION_TESTEMPL> APPLICATION_TESTEMPLS { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeTemplate> EmployeeTemplates { get; set; }
        public DbSet<EmployeeTemplateContent> TemplateContens { get; set; }
        public DbSet<EmployeeContentPharm> ContentPharms { get; set; }
        public DbSet<EmployeeTemplatePharm> EmployeeTemplatePharms { get; set; }
        public DbSet<EmployeeProtocolRights> EmployeeProtocolRights { get; set; }
        public DbSet<EmployeeAcceptNorm> EmployeeAcceptNorms { get; set; }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<PatientInfo> PatientInfo { get; set; }
        public DbSet<PatientInsurance> PatientInsurances { get; set; }
        public DbSet<PatientDiagnoses> PatientDiagnoses { get; set; }
        public DbSet<PatientMetric> PatientMetrics { get; set; }
        public DbSet<TherapyRecommendation> TherapyRecommendations { get; set; }
        public DbSet<TherapyPharm> TherapyPharms { get; set; }
        public DbSet<InsurancePolicy> InsurancePolicies { get; set; }
        public DbSet<InsuranceOrg> InsuranceOrgs { get; set; }
        public DbSet<Places> Places { get; set; }
        public DbSet<PlacesDepartment> PlacesDepartments { get; set; }
        public DbSet<PlacesEmail> PlaceEmails { get; set; }
        public DbSet<Protocols2> Protocols { get; set; }
        public DbSet<Protocols2Fields> ProtocolFields { get; set; }
        public DbSet<Protocols2Mkb10> ProtocolMkdb10s { get; set; }
        public DbSet<Protocols2Map> Protocols2Maps { get; set; }
        public DbSet<Services> Services { get; set; }
        public DbSet<ServicesPrice> ServicePrices { get; set; }
        public DbSet<Tasks> Tasks { get; set; }
        public DbSet<TasksPharm> TaskPharms { get; set; }
        public DbSet<TaskDocument> TaskDocuments { get; set; }
        public DbSet<TaskDocumentMetadata> TaskDocumentsMetadata { get; set; }
        public DbSet<Klass> Klasses { get; set; }
        public DbSet<Spec> Specs { get; set; }
        public DbSet<Mkb10_4> Mkb10s { get; set; }
        public DbSet<PatientOrderDisability> OrderDisabilitySheets { get; set; }
        public DbSet<DisabilitySheetPeriod> DisabilitySheetPeriods { get; set; }
        public DbSet<StatMetricParam> StatMetricParams { get; set; }
        public DbSet<EmplServiceTime> ServiceTimes { get; set; }
        public DbSet<EmergencyNotification> EmergencyNotifications { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");

            modelBuilder.Entity<Employee>().ToTable("EMPLOYEE");
            modelBuilder.Entity<EmployeeTemplate>().ToTable("EMPLOYEE_TEMPLATES");
            modelBuilder.Entity<EmployeeTemplateContent>().ToTable("EMPLOYEE_TEMPLATES_CONTENT");
            modelBuilder.Entity<EmployeeContentPharm>().ToTable("EMPLOYEE_TEMPLATES_CONTENT_PHARM");
            modelBuilder.Entity<EmployeeTemplatePharm>().ToTable("EMPLOYEE_TEMPLATE_PHARMS");
            modelBuilder.Entity<EmployeeProtocolRights>().ToTable("EMPLOYEE_PROTOCOL_RIGHTS");
            modelBuilder.Entity<EmployeeAcceptNorm>().ToTable("EMPLOYEE_ACCEPT_NORM");
            modelBuilder.Entity<Patient>().ToTable("PATIENT");
            modelBuilder.Entity<PatientInfo>().ToTable("PATIENT_INFO");
            modelBuilder.Entity<PatientInsurance>().ToTable("PATIENT_INSURANCE");
            modelBuilder.Entity<InsurancePolicy>().ToTable("INSURANCE_POLICY");
            modelBuilder.Entity<InsuranceOrg>().ToTable("INSURANCE_ORG");
            modelBuilder.Entity<PatientDiagnoses>().ToTable("PATIENT_DIAGNOSES");
            modelBuilder.Entity<PatientMetric>().ToTable("PATIENT_METRIC");
            modelBuilder.Entity<TherapyRecommendation>().ToTable("THERAPY_RECOMMENDATIONS");
            modelBuilder.Entity<TherapyPharm>().ToTable("THERAPY_PHARM");
            modelBuilder.Entity<Places>().ToTable("PLACES");
            modelBuilder.Entity<PlacesDepartment>().ToTable("PLACES$DEPARTMENTS");
            modelBuilder.Entity<PlacesEmail>().ToTable("PLACES_EMAILS");
            modelBuilder.Entity<Protocols2>().ToTable("PROTOCOLS2");
            modelBuilder.Entity<Protocols2Fields>().ToTable("PROTOCOLS2_FIELDS");
            modelBuilder.Entity<Protocols2Mkb10>().ToTable("PROTOCOLS2_MKB10");
            modelBuilder.Entity<Protocols2Map>().ToTable("PROTOCOLS2_MAP");
            modelBuilder.Entity<Services>().ToTable("SERVICES");
            modelBuilder.Entity<ServicesPrice>().ToTable("SERVICES_PRICE");
            modelBuilder.Entity<Tasks>().ToTable("TASKS");
            modelBuilder.Entity<TasksPharm>().ToTable("TASKS_PHARM");
            modelBuilder.Entity<TaskDocument>().ToTable("TASKS_DOCUMENT");
            modelBuilder.Entity<TaskDocumentMetadata>().ToTable("TASKS_DOCUMENT_METADATA");
            modelBuilder.Entity<Klass>().ToTable("KLASS").HasKey(x => new { x.klass_name, x.klass_id});
            modelBuilder.Entity<Spec>().ToTable("SPEC");
            modelBuilder.Entity<PatientOrderDisability>().ToTable("PATIENT_ORDER_DISABILITY");
            modelBuilder.Entity<DisabilitySheetPeriod>().ToTable("DISABILITY_SHEET_PERIOD");
            modelBuilder.Entity<StatMetricParam>().ToTable("STAT_METRIC_PARAM");
            modelBuilder.Entity<EmplServiceTime>().ToTable("EMPLOYEE_SERVICE_TIME");
            modelBuilder.Entity<EmergencyNotification>().ToTable("EMERGENCY_NOTIFICATION");
            modelBuilder.Entity<EmergencyNotification>().Property(x => x.date_in).HasColumnType("datetime");
            modelBuilder.Entity<EmergencyNotification>().Property(x => x.date_primary_alarm).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<EmergencyNotification>().Property(x => x.date_sending).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<EmployeeTemplatePharm>().Property(x => x.idm_mkb10).IsOptional();
            modelBuilder.Entity<EmployeeProtocolRights>().Property(x => x.user_cor).IsOptional();
            modelBuilder.Entity<EmployeeProtocolRights>().Property(x=>x.date_cor).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<Tasks>().Property(x => x.price).HasPrecision(18, 2);
            modelBuilder.Entity<TasksPharm>().Property(x => x.count).HasPrecision(12, 3);
            modelBuilder.Entity<TasksPharm>().Property(x => x.pricePerUnit).HasPrecision(14, 2);
            modelBuilder.Entity<ServicesPrice>().Property(x => x.price).HasPrecision(10, 2);
            modelBuilder.Entity<Patient>().Property(x => x.pasp_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<Patient>().Property(x => x.date_in_).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<Patient>().Property(x => x.first_visit).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<Patient>().Property(x => x.last_visit).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientMetric>().Property(x => x.date_in).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientDiagnoses>().Property(x => x.order_id).IsOptional();
            modelBuilder.Entity<PatientDiagnoses>().Property(x => x.proof_type).IsOptional();
            modelBuilder.Entity<TherapyRecommendation>().Property(x => x.date_in).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<TherapyRecommendation>().Property(x => x.begin_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<TherapyRecommendation>().Property(x => x.end_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<TherapyRecommendation>().Property(x => x.order_id).IsOptional();
            modelBuilder.Entity<TherapyPharm>().Property(x => x.date_in).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<TherapyPharm>().Property(x => x.end_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<TherapyPharm>().Property(x => x.order_id).IsOptional();
            modelBuilder.Entity<PatientInfo>().Property(x => x.date_cor).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientInfo>().Property(x => x.user_cor).IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.date_in).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.date_b).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.begin_date).HasColumnType("datetime");
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.end_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.fam_relationship).IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.hln_begin_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.hln_end_date).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<PatientOrderDisability>().Property(x => x.to_work_with).HasColumnType("datetime").IsOptional();
            modelBuilder.Entity<DisabilitySheetPeriod>().Property(x => x.end_date).HasColumnType("datetime").IsOptional();
        }

        private void FixEfProviderServicesProblem()
        {
            // The Entity Framework provider type 'System.Data.Entity.SqlServer.SqlProviderServices, EntityFramework.SqlServer'
            // for the 'System.Data.SqlClient' ADO.NET provider could not be loaded. 
            // Make sure the provider assembly is available to the running application. 
            // See http://go.microsoft.com/fwlink/?LinkId=260882 for more information.
            var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }
    }
}
