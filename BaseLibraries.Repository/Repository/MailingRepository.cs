using BaseLibraries.Models.informMsg;
using BaseLibraries.Repository.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.Repository.ext;

namespace BaseLibraries.Repository.Repository
{
    public class MailingRepository : AbstractBaseSettings, IMailingRepository
    {
        public List<DTOMailing> GetListMailing (int db_table_id, string db_table_name)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ToString()))
            {
                conn.Open();
                string query = @"select eml.id, eml.IsSend, isnull( ke.fam + ' ' + ke.name + ' ' + ke.otch , '')empl,  eml.idm_empl,
                                db_table_id, db_table_name
                                From EMPL_MAILING_LIST eml with(nolock) 
                                left join KAD$EMPLOYEE ke on ke.id = eml.idm_empl
                                where db_table_name = @db_table_name and db_table_id = @db_table_id and eml.del =0";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("db_table_id", db_table_id);
                cmd.Parameters.AddWithValue("db_table_name", db_table_name);

                SqlDataReader reader = cmd.ExecuteReader();
                 
                List<DTOMailing> tmp_fromMap = reader.MapToModel<DTOMailing>();

                return tmp_fromMap;
            }

        }
        public bool DeleteMailing(int idm_billing)
        {
            using (var _context = currentContext)
            {
                var mail = _context.EMPL_MAILING_LISTs.Where(x => x.id == idm_billing).FirstOrDefault();
                if (mail == null)
                    return false;

                mail.del = 1;

                try
                {
                    _context.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
        public bool Add(DTOMailing item)
        {
            using (var _context = currentContext)
            {
                EMPL_MAILING_LIST mail = new EMPL_MAILING_LIST
                {
                    db_table_id = item.db_table_id,
                    idm_empl = item.idm_empl_mail,
                    db_table_name = item.db_table_name,
                    IsSend = 0,
                    del = 0

                };
                 

                try
                {
                    _context.EMPL_MAILING_LISTs.Add(mail);
                    _context.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
    public interface IMailingRepository
    {
        List<DTOMailing> GetListMailing(int db_table_id, string db_table_name);
        bool DeleteMailing(int idm_billing);
        bool Add(DTOMailing item);
    }
}
