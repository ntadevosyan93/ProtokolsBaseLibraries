using BaseLibraries.Handlers;
using Clinic.Development;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;

namespace BaseLibraries.Ado.Helpers
{
    
    public static class DataHelper
    {
        public static event ErrorHandler OnError;

        public static T Convert<T>(object obj)
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
                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();

                    OnError?.Invoke($"Метод -> ExecuteReader<T>(IDbCommand cmd) для T типа:{typeof(T).Name} -> При получении данных произошла ошибка: " + ex.Message);
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
                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();

                    OnError?.Invoke($"Метод -> ExecuteNonQuery(IDbCommand cmd) -> При получении данных произошла ошибка: " + ex.Message);
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
                    new System.Threading.Tasks.Task(() => {
                        EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                            System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                    }).Start();

                    OnError?.Invoke($"Метод -> ExecuteScalar(IDbCommand cmd) -> При получении данных произошла ошибка: " + ex.Message);
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
