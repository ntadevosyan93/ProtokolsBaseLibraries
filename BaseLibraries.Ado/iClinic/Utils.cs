using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using BaseLibraries.Models.iClinic.Views;
using BaseLibraries.Handlers;
using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using Clinic.Development;

namespace BaseLibraries.Ado.iClinic
{
    public static class Utils
    {
        public static event ErrorHandler OnError = delegate { };

        public static string iClinic = "Data Source=192.168.17.4;Initial Catalog=iClinic;Persist Security Info=True;User ID=sa;Password=@WSX2wsx";
        public static string InformMSG = "Data Source=192.168.17.4;Initial Catalog=InformMSG;Persist Security Info=True;User ID=sa;Password=@WSX2wsx";

        public static IUser Login(string login, string password,WorkPlaceInfo info)
        {
            IUser value = new UserView();
            value.logined = false;
            try
            {
                using (SqlConnection connection = new SqlConnection(iClinic))
                {
                    connection.Open();
                    var cmd = new SqlCommand("Protocols_Login", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@password", password);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        value.id = Convert<int>(reader["id"]);
                        value.fio = Convert<string>(reader["fio"]);
                        value.doctor_cat = Convert<string>(reader["cat"]);
                        value.doctor_academ = Convert<string>(reader["academ"]);
                        value.pass = password;
                        value.id1c = Convert<string>(reader["idm_1c"])?.Trim();
                        value.admin = Convert<byte>(reader["admin"]) == 1 ? true : false;
                        value.eko = Convert<byte>(reader["eko"]) == 1 ? true : false;
                        value.guid = Convert<string>(reader["guid"]);
                        value.logined = true;
                        value.show_check_list = Convert<bool>(reader["show_check_list"]);
                        value.is_test_user = Convert<int>(reader["is_test_user"]) == 1 ? true : false;
                        value.allow_service_time = Convert<int>(reader["allow_service_time"]) == 1 ? true : false;
                        value.IsDepartmentHead = Convert<bool>(reader["IsDepartmentHead"]);
                        value.IsModerator = Convert<bool>(reader["IsModerator"]);
                        value.IsProtocolReset = Convert<bool>(reader["IsProtocolReset"]);
                        value.IsProtocolEdit = Convert<bool>(reader["IsProtocolEdit"]);
                    }
                }
            }
            catch (SqlException ex)
            {
                OnError?.Invoke("Ошибка при установке соединения:" + ex.Message);

                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();
            }

            Log_login(login, password, value.logined, info);

            return value;
        }


        public static void Log_login(string try_login, string try_password, bool login_result,WorkPlaceInfo info)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(iClinic))
                {
                    connection.Open();
                    SqlCommand comm = new SqlCommand(@" INSERT INTO dbo.LOG (comp_name, ip, try_login, try_password, login_result, app_version)
                                                        VALUES (@comp_name, @ip, @try_login, @try_password, @login_result, @app_version)
                                                      ", connection);
                    comm.Parameters.AddWithValue("@comp_name", info.CompName);
                    comm.Parameters.AddWithValue("@ip", info.IP);
                    comm.Parameters.AddWithValue("@try_login", try_login);
                    comm.Parameters.AddWithValue("@try_password", try_password);
                    comm.Parameters.AddWithValue("@login_result", login_result ? 1 : 0);
                    comm.Parameters.AddWithValue("@app_version", info.Version);
                    comm.Parameters.AddWithValue("@app_name", info.ProgName);
                    comm.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();
            }
        }

        public static T Get<T>(string sql,object id) where T : new()
        {
            var cmd = new SqlCommand(sql);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);

            return cmd.ExecuteReader<T>(iClinic).FirstOrDefault();
        }


        #region private members

        static void executeWithoutResult(string name, params object[] args)
        {
            using (var connection = new SqlConnection(iClinic))
            {
                var cmd = connection.CreateCommand();
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = name;
                fillParametr(name, cmd, args);
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        static void fillParametr(string name, SqlCommand cmd, params object[] args)
        {
            var parameters = getParametrListByName(name);
            for (int i = 0; i < (parameters.Count <= args.Length ? parameters.Count : args.Length); i++)
            {
                setParametr(parameters[i], cmd, (args[i] ?? DBNull.Value));
            }
        }

        static List<Tuple<string, SqlDbType>> getParametrListByName(string procedureName)
        {
            var result = new List<Tuple<string, SqlDbType>>();
            using (var connection = new SqlConnection(iClinic))
            {
                var cmd = new SqlCommand(procedureName, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlCommandBuilder.DeriveParameters(cmd);
                foreach (SqlParameter p in cmd.Parameters)
                {
                    if (!p.ParameterName.Equals("@RETURN_VALUE"))
                        result.Add(new Tuple<string, SqlDbType>(p.ParameterName, p.SqlDbType));
                }
            }
            return result;
        }

        static void setParametr(Tuple<string, SqlDbType> parameter, SqlCommand cmd, object value)
        {
            if (parameter.Item2 == SqlDbType.Structured)
            {
                var parametr = cmd.Parameters.AddWithValue(parameter.Item1, value);
                parametr.SqlDbType = SqlDbType.Structured;
                parametr.TypeName = ((DataTable)value).Namespace + "." + ((DataTable)value).TableName;
            }
            else
            {
                cmd.Parameters.Add(parameter.Item1, parameter.Item2).Value = value;
            }
        }

        static DataTable getSortListParams {
            get
            {
                var value = new DataTable("sortList", "dbo");
                value.Columns.Add("id", typeof(int));
                value.Columns.Add("sort_idx", typeof(int));
                return value;
            }
        }

        public static T Convert<T>(object obj)
        {
            try
            {
                if (obj == null || obj == DBNull.Value)
                {
                    return default(T);
                }
                else
                {
                    return (T)obj;
                }
            }
            catch (Exception ex)
            {
                var targetType = typeof(T);
                var sourceType = obj.GetType();

                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                throw new Exception($"Целевой тип {targetType.Name}, источник {sourceType.Name}", ex);
            }
        }

        public static string GetServiceType(int root_id)
        {
            switch (root_id)
            {
                case 1124:
                    return "Лабораторная диагностика";
                case 1125:
                    return "Консультативный прием";
                case 1126:
                    return "Инструментальная диагностика";
                default:
                    return string.Empty;
            }
        }

        public static int GetServiceTypeId(string name)
        {
            switch (name)
            {
                case "Лабораторная диагностика":
                    return 1124;
                case "Консультативный прием":
                    return 1125;
                case "Инструментальная диагностика":
                    return 1126;
                default:
                    throw new ArgumentException();
            }
        }

        #endregion

        #region CommandRunner
        public static List<T> ExecuteReader<T>(this IDbCommand cmd, string connectionString) where T : new()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    cmd.Connection = connection;
                    IDataReader reader = cmd.ExecuteReader();
                    return reader.MapToModel<T>();

                }
                catch (Exception ex)
                {
                    OnError?.Invoke($"Метод -> ExecuteReader<T>(IDbCommand cmd) для T типа:{typeof(T).Name} -> При получении данных произошла ошибка: " + ex.Message);

                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();
                }
                finally
                {
                    connection.Close();
                }

                return new List<T>();
            }
        }

        public static void ExecuteNonQuery(this IDbCommand cmd, string connectionString)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    OnError?.Invoke($"Метод -> ExecuteNonQuery(IDbCommand cmd) -> При получении данных произошла ошибка: " + ex.Message);

                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        public static object ExecuteScalar(this IDbCommand cmd, string connectionString)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    cmd.Connection = connection;
                    return cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    OnError?.Invoke($"Метод -> ExecuteScalar(IDbCommand cmd) -> При получении данных произошла ошибка: " + ex.Message);

                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();
                }
                finally
                {
                    connection.Close();
                }

                return null;
            }
        }

        #endregion

        #region Mapper
        public static List<T> MapToModel<T>(this IDataReader dr) where T : new()
        {
            var model = typeof(T);
            var values = new List<T>();
            var hashtable = new Hashtable();

            foreach (PropertyInfo propInfo in model.GetProperties())
            {
                var attr = propInfo.GetCustomAttributes(typeof(ColumnMap), true).FirstOrDefault() as ColumnMap;
                if (attr == null) continue;
                hashtable[attr.Name.ToUpper()] = propInfo;
            }

            while (dr.Read())
            {
                T value = new T();
                for (int index = 0; index < dr.FieldCount; index++)
                {
                    var source = dr.GetValue(index);
                    var target = new object();

                    var propInfo = (PropertyInfo)hashtable[dr.GetName(index).ToUpper()];

                    if ((propInfo != null) && propInfo.CanWrite)
                    {
                        if (source == null || source == DBNull.Value)
                        {
                            target = GetDefault(propInfo.PropertyType);
                        }
                        else
                        {
                            target = source;
                        }

                        propInfo.SetValue(value, target, null);
                    }
                }
                values.Add(value);
            }
            dr.Close();
            return values;
        }

        public static object GetDefault(Type t)
        {
            Func<object> f = GetDefault<object>;
            return f.Method.GetGenericMethodDefinition().MakeGenericMethod(t).Invoke(null, null);
        }

        private static T GetDefault<T>()
        {
            return default(T);
        }

        #endregion
    }
}
