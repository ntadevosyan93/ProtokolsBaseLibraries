using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Helpers
{
    public static class IListExtensions
    {
        /// <summary>
        /// Поменять местами объекты в коллекции
        /// </summary>
        /// <typeparam name="T">Тип объекта</typeparam>
        /// <param name="list"></param>
        /// <param name="sourceIndex">Что</param>
        /// <param name="targetIndex">С чем</param>
        public static void Swap<T>(
            this IList<T> list,
            int sourceIndex,
            int targetIndex
        )
        {
            Contract.Requires(list != null);
            Contract.Requires(sourceIndex >= 0 && sourceIndex < list.Count);
            Contract.Requires(targetIndex >= 0 && targetIndex < list.Count);
            if (sourceIndex == targetIndex || targetIndex == -1)
            {
                return;
            }
            T temp = list[sourceIndex];
            list[sourceIndex] = list[targetIndex];
            list[targetIndex] = temp;
        }

        public static IEnumerable<T> Filter<T>(this IEnumerable<T> list, Func<T, bool> filterParam)
        {
            return list.Where(filterParam);
        }
    }
}
