using BaseLibraries.EnitityContext;
using BaseLibraries.Models.informMsg;
using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.Repository.ext;
using BaseLibraries.Repository.Core;
using BaseLibraries.Common.Grid;
using System.Linq.Expressions;
using LinqKit;
using System.IO;
using RestSharp;
using System.Diagnostics;

namespace BaseLibraries.Repository.Repository
{
    public class FileRepository : AbstractBaseSettings, IFileRepository
    {
        public event Action<string> add_file;
        public event Action<string> del_file;


        public FileRepository( Func<string> Path = null)
        {
            _Path = Path;
        }

        TemplateContext _inf = new TemplateContext();
        ~FileRepository()
        { 
            _inf.Dispose();
        }

        Func<string> _Path { get; set; }



        public InformFILE_STOR GetModel(string guid)
        {
            using (var _Context = currentContext)
            {
                var model = _Context.InformFILE_STOR.Where(x => x.guid == guid).FirstOrDefault();
                if (_Path() != null)
                {
                    string _PathName = _Path();
                    if (!string.IsNullOrWhiteSpace(_PathName))
                    {
                        model.file_path = model.file_path.Replace(@"S:\", _PathName);
                    }
                }
                return model;
            }
        }


        public List<DTOFile> GetListFile(string db_table, int? id=null)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ToString()))
            {
                string req_query = @"SELECT *
                                      FROM [InformMSG].[dbo].[FILE_STOR]
                                      where db_table = @db_table and del= 0
                                      and file_path is not null and [file_name] is not null and file_guid is not null ";
                conn.Open();
                SqlCommand cmd = new SqlCommand(req_query, conn);
                cmd.CommandTimeout = 0;
                if (id != null)
                {
                    cmd.CommandText += " and  [db_table_id] =  @id";
                    cmd.Parameters.AddWithValue("@id", id);
                }
                cmd.Parameters.AddWithValue("@db_table", db_table);
                SqlDataReader reader = cmd.ExecuteReader();

                var tmp_fromMap = reader.MapToModel<DTOFile>();

                return tmp_fromMap;

            }
        }
        

        public List<DTOFile> GetListFile(Expression<Func<InformFILE_STOR, bool>> expr)
        {
            using (var _Context = currentContext)
            {
                Func<InformFILE_STOR, bool> inst = (x) => { return x.del == 1; };
                var lst = _inf.InformFILE_STOR.AsQueryable();
                if (expr != null)
                {
                    //Expression<Func<InformFILE_STOR, bool>> expr = a => inst(a);  //inst.Invoke(a);
                    lst = lst.Where(expr);
                }
                var tmp = lst
                    .Take(2000)
                    .ToList();

                return tmp.Select(x => new DTOFile
                {
                    date_in = x.date_in,
                    db_table = x.db_table,
                    db_table_id = Convert.ToInt32(x.db_table_id),
                    del = Convert.ToInt32(x.del),
                    description = x.description,
                    file_guid = x.file_guid,
                    file_name = x.file_name,
                    file_path = x.file_path,
                    guid = x.guid,
                    id = x.id,
                    ip_in = x.ip_in,
                    module = x.module,
                    user_in = x.user_in
                }
                ).ToList();
            }   
        }
        public InformFILE_STOR CreateEmptyFile(string module, string db_table)
        {
            Guid f = Guid.NewGuid();

            InformFILE_STOR ret = new InformFILE_STOR
            {
                //date_in = _hlp.GetD
                guid = Guid.NewGuid().ToString(),
                file_path = @"s:\workflow\file_stor\",
                del = 0,
                module = module,
                db_table = db_table

            };

            return ret;

        }

        public InformFILE_STOR SubmitFile(InformFILE_STOR item)
        {

            using (var _Context = currentContext)
            {
                if (item.id == 0)
                {
                    InformFILE_STOR ins = new InformFILE_STOR
                    {
                        file_guid = item.file_guid,
                        del = 0,
                        db_name = "",
                        db_table = item.db_table,
                        ip_in = item.ip_in,
                        file_path = item.file_path,
                        file_name = item.file_name,
                        module = item.module,
                        db_table_id = item.db_table_id,
                        guid = item.guid,
                        description = item.description
                    };
                    try
                    {
                    _Context.InformFILE_STOR.Add(ins);

                    _Context.SaveChanges();

                        add_file?.Invoke(ins.guid);

                    }
                    catch(Exception ex)
                    {
                        Debug.WriteLine(ex.Message);
                        return null;
                    }
                    return ins;
                }
                else
                    return item;

            }
        }

        public bool DelFile(byte type, int uid)
        {

            using (var _Context = currentContext)
            {
                var file = _Context.InformFILE_STOR.Where(x => x.id == uid).FirstOrDefault();
                if (file == null)
                {
                    return false;
                }
                else
                {
                    file.del = type;
                    try
                    {
                        _Context.SaveChanges();
                        del_file?.Invoke(file.guid);
                    }
                    catch
                    { return false; }
                    return true;
                }
            }
        }

        public bool DelFile(byte type, string guid)
        {

            using (var _Context = currentContext)
            {
                var file = _Context.InformFILE_STOR.Where(x => x.guid == guid).FirstOrDefault();
                if (file == null)
                {
                    return false;
                }
                else
                {
                    file.del = type;
                    try
                    {
                        _Context.SaveChanges();
                        del_file?.Invoke(guid);
                    }
                    catch
                    { return false; }
                    return true;
                }
            }
        }
        public List<DTOFilter> GetColumns(string col)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["InformMSGConnectionString"].ToString()))
            {
                string req_query = string.Format(@"IF OBJECT_ID('tempdb..##file_{0}') IS  NULL 
                                        begin

                                        select {0} , count({0}) cout
                                        into ##file_{0}
                                        From FILE_STOR
                                        where rtrim(ltrim({0})) != '' and {0} is not null
                                        group by {0}
                                        end 

                                        select *
                                        From ##file_{0}
                                        order by cout desc
                                      ", col);
                conn.Open();
                SqlCommand cmd = new SqlCommand(req_query, conn);
                cmd.CommandTimeout = 0;

                SqlDataReader reader = cmd.ExecuteReader();
                List<DTOFilter> lst = new List<DTOFilter>();
                while(reader.Read())
                {
                    lst.Add(new DTOFilter
                    {
                        id = 0,
                        text = reader[0].ToString(),
                        count = Convert.ToInt32(reader[1])
                    });
                }
                return lst;
            }
        }

        public bool SaveFileToWeb1(byte[] arr, InformFILE_STOR file)
        {
            var client = new RestClient("http://webserver.vipcg.ru/Files/upload.aspx");
            // client.Authenticator = new HttpBasicAuthenticator(username, password);
            var request = new RestRequest("resource/{id}");
            request.AddParameter("user_in", file.user_in, ParameterType.GetOrPost);
            request.AddParameter("file_path", file.file_path);
            request.AddParameter("module", file.module);
            request.AddParameter("db_name", file.db_name);
            request.AddParameter("db_table", file.db_table);
            request.AddParameter("db_table_id", file.db_table_id);
            request.AddParameter("db_table_guid", file.db_table_guid);
            request.AddParameter("description", file.description);

            request.AddFile("file",arr,file.file_name);
            var response = client.Post(request);
            var content = response.Content; // raw content as string

            return true;
        }

        public bool SaveFileToWeb1OverClinicInform(InformFILE_STOR file, byte[] bytes)
        {
            try
            {
                var client = new RestClient("http://webserver.vipcg.ru/ClinicInform/Files.asmx/UploadFile");
                // client.Authenticator = new HttpBasicAuthenticator(username, password);
                var request = new RestRequest();
                request.AddParameter("fileName", file.file_guid, ParameterType.GetOrPost);
                request.AddParameter("path", @"S:\workflow\file_stor\");
                //byte[] bytes = File.ReadAllBytes(@"S:\Мельник Е.Г..pdf");
                request.AddParameter("bytes", Convert.ToBase64String(bytes));

                var response = client.Post(request);
                var content = response.Content; // raw content as string

                return true;
            }
            catch
            {
                return false;

            }
        }

        public bool ListCopy(List<DTOFile> lst, string folder)
        {
            using (var _Context = currentContext)
            {
                if(!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                foreach(var f in lst.Take(2000))
                {
                    File.Copy(f.file_path + f.file_guid, folder + f.file_guid);
                }

                return true;
            }
        }

    }

    public interface IFileRepository
    {
        event Action<string> add_file;
        event Action<string> del_file;

        InformFILE_STOR GetModel(string guid);
        InformFILE_STOR CreateEmptyFile(string module, string db_table);
        InformFILE_STOR SubmitFile(InformFILE_STOR item);
        List<DTOFile> GetListFile(string db_table, int? id = null);
        List<DTOFile> GetListFile(Expression<Func<InformFILE_STOR, bool>> expr = null);
        List<DTOFilter> GetColumns(string col);
        bool ListCopy(List<DTOFile> lst, string folder);
        bool DelFile(byte type, int uid);
        bool DelFile(byte type, string guid);
        bool SaveFileToWeb1(byte[] arr, InformFILE_STOR file);
        bool SaveFileToWeb1OverClinicInform(InformFILE_STOR file, byte[] bytes);
     
    }
}
