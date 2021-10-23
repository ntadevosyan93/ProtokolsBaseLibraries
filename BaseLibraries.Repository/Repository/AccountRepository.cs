using BaseLibraries.Models.informMsg;
using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.Core;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Repository
{
    public  class AccountRepository : AbstractBaseSettings, IAccountRepository
    {

        public AccountRepository( Func<SiteOptions> siteoptions=null)
        {
            GetSiteOptions = siteoptions;
        }

        public Func<SiteOptions> GetSiteOptions { get; set; }

        public KadEmployee GetFioUser()
        {
            string NameUser = this.GetOptions().CurrentUser;
            return GetFIOUser(NameUser ?? "");
        }

        
        public bool GetAccess(string rights, bool isReally = false)
        {
            string prefix = GetSiteOptions().rules_prefix;

            var user = (isReally? this.GetOptions().UserName: this.GetOptions().CurrentUser).Replace("VIPCG\\", "");

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(string.Format("SELECT COUNT(id) FROM [dbo].[KAD$EMPLOYEE_AD_GROUPS] with (nolock) where (UPPER(groupName)=@rights or UPPER(groupName) = UPPER('{0}_MAX') ) AND UPPER(member)=@user", prefix), conn);
                cmd.Parameters.AddWithValue("@user", user.ToUpper());
                cmd.Parameters.AddWithValue("@rights", rights.ToUpper());

                int count = Int32.Parse(cmd.ExecuteScalar().ToString());
                return count > 0 ? true : false;
            }
        }

        public bool IsIncidentAccess(int idm_region)
        {
            string NameUser = this.GetOptions().CurrentUser;

            using (var _Context = currentContext)
            {
                var currentUser = _Context.KadEmployees.Where(x => x.login_ad == NameUser).FirstOrDefault();

                var regions_user = _Context.TT_SPR_REGION_EMPLs.Where(x => x.idm_empl == currentUser.id && x.idm_region == idm_region ).ToList();

                return regions_user.Any();
            }
        }

        public bool IsCurator()
        {
            string NameUser = this.GetOptions().CurrentUser;

            using (var _Context = new TemplateContext())
            {
                try
                {
                    var currentUser = _Context.KadEmployees.Where(x => x.login_ad == NameUser).FirstOrDefault();

                    var _curators = _Context.KAD_WORK_TIME_CURATORS.Where(x => x.idm_curator == currentUser.id).Any();

                    return _curators;
                }
                catch
                {
                    return false;
                }

            }
        }

        public bool IsUrist()
        {
            using (var _Context = currentContext)
            {
                var currentUser = GetFioUser();
                if (currentUser == null)
                    return false;
                var urist = _Context.EMPL_TO_OTDEL.Where(x => x.idm_empl == currentUser.id && x.idm_otdel== 1);
                return urist.Any();
                 
            }
        }

        public KadEmployee GetFIOUser(string NtUser)
        {

            if (!NtUser.Contains(@"VIPCG\"))
                NtUser = @"VIPCG\" + NtUser;

            using (var _Context = new TemplateContext())
            {
                try
                {
                    var this_GetNtUser = _Context.KadEmployees.Where(x => x.login_ad == NtUser && x.actual==1).FirstOrDefault();
                    return (this_GetNtUser == null ? new KadEmployee() { name = NtUser } : this_GetNtUser);
                }
                catch(Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                    return null;
                }
                
            }
        }

        public int GetContainsUserInOtdelByList(string list_otdel)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                int id = GetFioUser().id;
                cmd = new SqlCommand("SELECT idm_otdel from EMPL_TO_OTDEL  with (nolock)  where [idm_empl] =@idm  and idm_otdel in(select data from dbo.Split(@list,','))", conn);
                cmd.Parameters.AddWithValue("@idm", id);
                cmd.Parameters.AddWithValue("@list", list_otdel);
                object res = cmd.ExecuteScalar();
                return res != null && res != DBNull.Value ? (int)res : 0;
            }
        }

        public bool OtdelOfTheUser(  string otdel)
        {
            var currentUser = GetFioUser();
            if (currentUser == null)
                return false;
            else
            {
                return OtdelOfTheUser(currentUser.id, otdel);
            }
        }

        public  bool OtdelOfTheUser(int id, string otdel)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                string query = string.Format("SELECT count(id) from EMPL_TO_OTDEL  with (nolock)  where [idm_empl] =@idm and [idm_otdel] in ( {0})",otdel);
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@idm", id);
                //cmd.Parameters.AddWithValue("@otdel", otdel);
                if (int.Parse(cmd.ExecuteScalar().ToString()) > 0)
                    return true;
                else return false;
            }
        }
    }

    public interface IAccountRepository
    {
        KadEmployee GetFIOUser(string NtUser);
        KadEmployee GetFioUser();
        bool GetAccess(string rights, bool isReally = false);
        Func<UserOptions> GetOptions { get; set; }
        bool IsCurator();
        bool IsIncidentAccess(int idm_region);
        bool IsUrist();
        int GetContainsUserInOtdelByList(string list_otdel);
        bool OtdelOfTheUser(string otdel);
        bool OtdelOfTheUser(int id, string otdel);
    }
}
