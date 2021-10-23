using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Repository
{
    public abstract class AbstractBaseSettings
    {
        public  TemplateContext currentContext
        {
            get
            {
                return new TemplateContext()
                {
                    UserName = GetOptions().UserName
                };
            }
        }
        public virtual Func<UserOptions> GetOptions { get; set; }

        public virtual Func<string> GetIP { get; set; }

    }
    public class BaseSettings : AbstractBaseSettings
    { 

        public BaseSettings(Func<UserOptions> options = null)
        {
            GetOptions = options;
        }

    }
}

