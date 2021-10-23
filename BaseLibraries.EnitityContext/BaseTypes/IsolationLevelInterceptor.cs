using System.Data;
using System.Data.Common;
using System.Data.Entity.Infrastructure.Interception;

namespace BaseLibraries.EnitityContext.BaseTypes
{
    public class IsolationLevelInterceptor : DbCommandInterceptor
    {
        private IsolationLevel _isolationLevel;

        public IsolationLevelInterceptor(IsolationLevel level)
        {
            _isolationLevel = level;
        }

        public override void ReaderExecuting(DbCommand command, DbCommandInterceptionContext<DbDataReader> interceptionContext)
        {
            SetTransaction(command);
        }

        public override void ScalarExecuting(DbCommand command, DbCommandInterceptionContext<object> interceptionContext)
        {
            SetTransaction(command);
        }

        public override void NonQueryExecuting(DbCommand command, DbCommandInterceptionContext<int> interceptionContext)
        {
            SetTransaction(command);
        }

        private void SetTransaction(DbCommand command)
        {
            if (command != null)
            {
                if (command.Transaction == null)
                {
                    var t = command.Connection.BeginTransaction(_isolationLevel);
                    command.Transaction = t;
                }
            }
        }

    }
}
