using System;

namespace BaseLibraries.Helpers
{
    public static class ExceptionHelper
    {

        public static string GetExceptionMessage(this Exception e)
        {
            while (e.InnerException != null)
            {
                e = e.InnerException;
            }

            return e.Message;
        }

        public static Exception GetExceptionType(this Exception e)
        {
            while (e.InnerException != null)
            {
                e = e.InnerException;
            }

            return e;
        }


    }
}
