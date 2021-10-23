using BaseLibraries.Repository.Classes;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.ext
{
    public static class Ext
    {
        public static EventHandler OnError = delegate { };

        public static IEnumerable<T> SelectFromReader<T>(this SqlDataReader reader, Func<SqlDataReader, T> selector)
        {
            while (reader.Read())
            {
                yield return selector(reader);
            }
        }

        private static readonly long DatetimeMinTimeTicks =
   (new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).Ticks;

        public static long ToJavaScriptMilliseconds(this DateTime dt)
        {
            return (long)((dt.ToUniversalTime().Ticks - DatetimeMinTimeTicks) / 10000);
        }

        public static List<T> MapToModel<T>(this IDataReader dr) where T : new()
        {
            var model = typeof(T);
            var values = new List<T>();
            var hashtable = new Hashtable();

            foreach (PropertyInfo propInfo in model.GetProperties())
            {

                var attr = propInfo.GetCustomAttributes(typeof(ColumName), true).FirstOrDefault() as ColumName;
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

                        try
                        {
                            propInfo.SetValue(value, target, null);
                        }
                        catch
                        {

                        }
                    }
                }
                values.Add(value);
            }
            dr.Close();
            return values;
        }



        public static List<T> MapToModel2<T>(this IDataReader dr) where T : new()
        {
            var model = typeof(T);
            var values = new List<T>();
            var hashtable = new Hashtable();

            //Dictionary<T, string[]> tmp_lst = new Dictionary<T, string[]>();
            var props = model.GetProperties();

            foreach (PropertyInfo propInfo in props)
            {

                var attr = propInfo.GetCustomAttributes(typeof(ColumName), true).FirstOrDefault() as ColumName;

                if (propInfo.Name == "field_upd")
                {
                    hashtable[propInfo.Name.ToUpper()] = propInfo;
                    continue;
                }
                if (attr == null)
                    continue;
                hashtable[attr.Name.ToUpper()] = propInfo;

            }

            Dictionary<string, object> tmp_row = new Dictionary<string, object>();

            while (dr.Read())
            {
                T value = new T();
                List<string> arr = new List<string>();
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

                        try
                        {
                            if (tmp_row.Any())
                            {
                                if (!tmp_row[dr.GetName(index)].Equals(dr[index]))
                                {
                                    arr.Add(propInfo.Name);
                                    //tmp_row.Add(dr.GetName(index), target);
                                }


                                //tmp_row.ad
                            }
                            propInfo.SetValue(value, target, null);


                        }
                        catch (Exception ex)
                        {
                            OnError?.Invoke(ex, null);
                        }
                    }
                }
                tmp_row.Clear();
                //if(!tmp_row.Any())
                for (int i = 0; i < dr.FieldCount; i++)
                {
                    tmp_row.Add(dr.GetName(i), dr[i]);
                }

                var propInfo2 = (PropertyInfo)hashtable["FIELD_UPD"];
                propInfo2.SetValue(value, arr.ToArray(), null);

                //hashtable["field_upd"]

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


        public static bool IsNullOrEmpty(this JToken token)
        {
            return (token == null) ||
                   (token.Type == JTokenType.Array && !token.HasValues) ||
                   (token.Type == JTokenType.Object && !token.HasValues) ||
                   (token.Type == JTokenType.String && token.ToString() == String.Empty) ||
                   (token.Type == JTokenType.Null);
        }

        public static string NormPhone(this string ph_num)
        {
            if (string.IsNullOrWhiteSpace(ph_num))
                return "";
            //if (ph_num[0] == '+')
            //{
            //    ph_num = new string(ph_num.Skip(1).ToArray());
            //}
            ph_num = ph_num.Replace("-", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace(" ", "").Replace("+7", "7").Replace("+8", "7");

            if (ph_num.Length > 11)
            {
                ph_num = new string(ph_num.Reverse().Take(11).Reverse().ToArray());
            }
            if (ph_num.Length == 10 && ph_num[0] == '9')
            {
                ph_num = "7" + ph_num;
            }
            if (ph_num[0] == '8')
            {
                ph_num = '7' + new string(ph_num.Skip(1).ToArray());
            }
            if (ph_num == "anonymous")
                ph_num = "";


            return ph_num;
        }

    }

}
