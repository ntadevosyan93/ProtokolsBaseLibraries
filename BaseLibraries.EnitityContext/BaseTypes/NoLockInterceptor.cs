using System;
using System.Data.Common;
using System.Data.Entity.Infrastructure.Interception;
using System.Text.RegularExpressions;

namespace BaseLibraries.EnitityContext.BaseTypes
{
    public class NoLockInterceptor : DbCommandInterceptor
    {
        private static readonly Regex _tableAliasRegex =
            new Regex(@"(?<tableAlias>AS \[Extent\d+\](?! WITH \(NOLOCK\)))",
                RegexOptions.Multiline | RegexOptions.IgnoreCase);

        /// <summary>
        /// Отменть NoLock
        /// </summary>
        [ThreadStatic]
        public static bool CancellNoLock;

        public override void ScalarExecuting(DbCommand cmd,
            DbCommandInterceptionContext<object> ctx)
        {
            if (!CancellNoLock)
            {
                cmd.CommandText =
                    _tableAliasRegex.Replace(cmd.CommandText, "${tableAlias} WITH (NOLOCK)");
            }
        }

        public override void ReaderExecuting(DbCommand cmd, DbCommandInterceptionContext<DbDataReader> ctx)
        {
            if (!CancellNoLock)
            {
                cmd.CommandText =
                    _tableAliasRegex.Replace(cmd.CommandText, "${tableAlias} WITH (NOLOCK)");
            }
        }
    }
}
