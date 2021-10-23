using BaseLibraries.Models.MaternityHospital.Views;
using System.Data.Entity.ModelConfiguration;

namespace BaseLibraries.EnitityContext.Behaviors
{
    public class viewTaskListConfiguration : EntityTypeConfiguration<View_TaskList>
    {
        public viewTaskListConfiguration()
        {
            HasKey(x => x.id);
            ToTable("View_TaskList");
        }
    }

    public class viewTaskPageConfiguration : EntityTypeConfiguration<View_TaskPage>
    {
        public viewTaskPageConfiguration()
        {
            HasKey(x => x.id);
            ToTable("View_TaskPage");
        }
    }
}
