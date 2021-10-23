using Clinic.Development;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Helpers
{
    public static class EnumerableExtension
    {
        /// <summary>
        /// Разделяет последовательность на пакеты заданного размера
        /// </summary>
        /// <typeparam name="T">Параметр типа</typeparam>
        /// <param name="items">Последовательность</param>
        /// <param name="batchSize">Размер пакета</param>
        /// <returns></returns>
        public static IEnumerable<List<T>> ToBatch<T>(this IEnumerable<T> items, int batchSize)
        {
            List<T> batch = new List<T>(batchSize);
            foreach (var item in items)
            {
                batch.Add(item);
                if (batch.Count == batchSize)
                {
                    yield return batch;
                    batch = new List<T>(batchSize);
                }
            }
            if (batch.Any())
                yield return batch;
        }

        /// <summary>
        /// Разделяет последовательность на определенное количество пакетов
        /// </summary>
        /// <typeparam name="T">Параметр типа</typeparam>
        /// <param name="items">Последовательность</param>
        /// <param name="batchCount">Количество пакетов</param>
        /// <returns></returns>
        public static IEnumerable<List<T>> ToNBatches<T>(this IReadOnlyCollection<T> items, int batchCount)
        {
            var batchSize = items.Count / batchCount;
            return items.ToBatch(batchSize);
        }


        public static DataTable ConvertToDataTable<T>(this IEnumerable<T> collection, string tableName) where T : class
        {
            DataTable dt = new DataTable(tableName);
            try
            {
                foreach (PropertyInfo property in collection.First().GetType().GetProperties())
                {
                    var propName = property.Name;
                    var propType = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;

                    dt.Columns.Add(new DataColumn(propName, propType));
                }
                foreach (var item in collection)
                {
                    DataRow newRow = dt.NewRow();
                    foreach (PropertyInfo property in item.GetType().GetProperties())
                    {
                        var value = item.GetType().GetProperty(property.Name).GetValue(item, null) ?? DBNull.Value;

                        newRow[property.Name] = value;
                    }
                    dt.Rows.Add(newRow);
                }

            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                var m = ex.GetBaseException().Message;
                return null;
            }

            return dt;
        }

        public static string GenerateInsertString<T>(this IEnumerable<T> array, string tableName)
        {
            var list = array.ToList().ToBatch(999);

            var bulder = new StringBuilder();

            foreach (var item in list)
            {
                bulder.AppendLine($"insert into @{tableName} ({tableName}ID) values ({string.Join("), (", item)})");
            }

            return bulder.ToString();
        }


        public static IEnumerable<T> SelectRecursive<T>(this IEnumerable<T> source, Func<T, IEnumerable<T>> recursiveFunc)
        {
            if (source != null)
            {
                foreach (var mainItem in source)
                {
                    yield return mainItem;

                    IEnumerable<T> recursiveSequence = (recursiveFunc(mainItem) ?? new T[] { }).SelectRecursive(recursiveFunc);

                    if (recursiveSequence != null)
                    {
                        foreach (var recursiveItem in recursiveSequence)
                        {
                            yield return recursiveItem;
                        }
                    }
                }
            }
        }

        public static ObservableCollection<T> ToObservableCollection<T>(this IEnumerable<T> collection)
        {
            var result = new ObservableCollection<T>();

            foreach (var element in collection)
            {
                result.Add(element);
            }

            return result;
        }
    }
}
