using BaseLibraries.EnitityContext.BaseTypes;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using BaseLibraries.Models.informMsg;
using BaseLibraries.Models;
using BaseLibraries.Models.informMsg.WT;
using BaseLibraries.Models.informMsg.BILL;
using BaseLibraries.Models.informMsg.Incident;
using BaseLibraries.Models.informMsg.Dispatch;
using BaseLibraries.Models.informMsg.BILL.View;
using BaseLibraries.Models.informMsg.Dog;
using BaseLibraries.Models.informMsg.PSY;
using BaseLibraries.Models.informMsg.Employee;

namespace BaseLibraries.EnitityContext
{
    public class InformContext : BaseContext
    {

        public DbSet<KlassInform> Klasses { get; set; }
        public DbSet<PARTNER> Partner { get; set; }
        public DbSet<DEPARTMENTS> DEPARTMENTS { get; set; }
        public DbSet<KAD_DOLJN> KAD_DOLJN { get; set; }
        public DbSet<KadEmployee> KadEmployees { get; set; }
        public DbSet<Employee_Education> Employee_Educations { get; set; }
        public DbSet<InformFILE_STOR> InformFILE_STOR { get; set; }
        public DbSet<EMPL_TO_OTDEL> EMPL_TO_OTDEL { get; set; }
        public DbSet<Kadwork_time> Kadwork_times { get; set; }
        public DbSet<KadWork_Time_Date> KadWork_Time_Date { get; set; }
        public DbSet<KAD_WORK_TIME_Curator_day> KAD_WORK_TIME_Curator_days { get; set; }
        public DbSet<MSGMAIN> MSGMAINs { get; set; }
        public DbSet<UserLink> UserLInks { get; set; }
        public DbSet<KADWORK_TIME_CURATORS_NOT_SEND> KADWORK_TIME_CURATORS_NOT_SENDs { get; set; }
        public DbSet<RM_OS_TONER> RM_OS_TONERs { get; set; }
        public DbSet<KAD_WORK_TIME_CURATORS> KAD_WORK_TIME_CURATORS { get; set; }
        public DbSet<Kadwork_time_history> Kadwork_time_historys { get; set; }
        public DbSet<RMACCESSORIES> RMACCESSORIES { get; set; }
        public DbSet<RM_OS_TONER_ADDITION> RM_OS_TONER_ADDITIONs { get; set; }
        public DbSet<RMOSTYPE> RMOSTYPEs { get; set; }
        public DbSet<RMOS> RMOSs { get; set; }
        public DbSet<view_rmos_grid> view_rmos_grids { get; set; }
        public DbSet<RM_OS_BILLING_INVOICE> RM_OS_BILLING_INVOICEs { get; set; }
        public DbSet<View_RM_OS_BILLING2> View_RM_OS_BILLING2 { get; set; }
        public DbSet<RM_OS_BILLING> RM_OS_BILLINGs { get; set; }
        public DbSet<KADEmployeeVectorWork> KADEmployeeVectorWorks { get; set; }
        public DbSet<EMPL_MAILING_ALL> EMPL_MAILING_ALLs { get; set; }
        public DbSet<KAD_ENTLASSUNG_EMPLOYEE> KAD_ENTLASSUNG_EMPLOYEEs { get; set; }
        public DbSet<ViewENTLASSUNG> ViewENTLASSUNGs { get; set; }
        public DbSet<View_Entlassung_NOT_ACTUAL> View_Entlassung_NOT_ACTUALs { get; set; }
        public DbSet<View_TT_MAIN_NEW> View_TT_MAIN_NEWs { get; set; }
        public DbSet<View_TT_Pretensions> View_TT_Pretensions { get; set; }
        public DbSet<TT_MAIN> TT_MAINs { get; set; }
        public DbSet<TT_Pretensiya> TT_Pretensions { get; set; }
        public DbSet<TT_SPR_REGION> TT_SPR_REGIONs { get; set; }
        public DbSet<TT_MAIN_COLLABORATORS> TT_MAIN_COLLABORATORS { get; set; }
        public DbSet<View_TT_MAIN_COLLABORATORS> View_TT_MAIN_COLLABORATORS { get; set; }
        public DbSet<TT_SPR_REGION_EMPL> TT_SPR_REGION_EMPLs { get; set; }
        public DbSet<EMPL_MAILING_LIST> EMPL_MAILING_LISTs { get; set; }
        public DbSet<View_Sogl> View_Sogl_Urs { get; set; }
        public DbSet<View_edit_Billing> View_edit_Billings { get; set; }
        public DbSet<RM_BUDGET_GROUPINGS> RM_BUDGET_GROUPINGSs { get; set; }

        public DbSet<IncomingGridView> IncomingGridViews { get; set; }
        public DbSet<OutcomingGridView> OutcomingGridViews { get; set; }
        public DbSet<DISPATCH_INCOMING> DISPATCH_INCOMINGs { get; set; }
        public DbSet<DISPATCH_OUTCOMING> DISPATCH_OUTCOMINGs { get; set; }

        public DbSet<View_KAD_EMPL_ACTUAL> View_KAD_EMPL_ACTUALs { get; set; }
        
        public DbSet<DOGOVORS_REG> DOGOVORS_REGs { get; set; }

        public DbSet<view_dogovor> view_dogovors { get; set; }

        public DbSet<View_billing_dataSend> View_billing_dataSends { get; set; }

        public DbSet<DEPARTMENTS_OFFICES> DEPARTMENTS_OFFICESs { get; set; }

        public DbSet<KAD_PSY_TEST_Protocol_CAND> KAD_PSY_TEST_Protocol_CANDs { get; set; }

        public DbSet<KAD_PSY_TEST_Protocol_CAND_History> KAD_PSY_TEST_Protocol_CAND_Historys { get; set; }

        public DbSet<View_psy_Download> View_psy_Downloads { get; set; }

        public DbSet<View_Psy_load> View_Psy_loads { get; set; }

        public DbSet<View_ExportEmployee1C> View_ExportEmployee1Cs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");

            modelBuilder.Entity<KlassInform>().ToTable("KLASS");
            modelBuilder.Entity<KlassInform>()
                .ToTable("KLASS")
                .HasKey(x => new { x.id });

            modelBuilder.Entity<PARTNER>()
                .ToTable("PARTNER")
                .HasKey(x => new { x.id });

            modelBuilder.Entity<Kadwork_time>()
                .ToTable("KAD$WORK_TIME")
                .HasKey(x => new { x.guid });

            modelBuilder.Entity<EMPL_TO_OTDEL>()
                .ToTable("EMPL_TO_OTDEL")
                .HasKey(x => new { x.id });

            modelBuilder.Entity<DEPARTMENTS>()
                    .ToTable("DEPARTMENTS")
                    .HasKey(x => new { x.id });

            modelBuilder.Entity<KAD_DOLJN>()
            .ToTable("KAD$DOLJN")
            .HasKey(x => new { x.id });

            modelBuilder.Entity<KadEmployee>()
            .ToTable("KAD$EMPLOYEE")
            .HasKey(x => new { x.id });

            modelBuilder.Entity<InformFILE_STOR>()
                .ToTable("FILE_STOR")
                .HasKey(x => new { x.id });

        }
    }
   
}
