using BaseLibraries.Models.informMsg;
using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.Core;
using BaseLibraries.Repository.DTO;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Repository
{
    public class UserLogRepository: AbstractBaseSettings, IUserLogRepository
    {
        public UserLogRepository(Func<string> IP = null)
        {
            _IP = IP;
        }

        Func<string> _IP { get; set; }

        public List<DTOLink> GetLink(Expression<Func<UserLink,bool>> exp = null)
        {
            using (var _Context = currentContext)
            {
                var q =
                    _Context.UserLInks
                    .AsQueryable();

                    if(exp!=null)
                    {
                    q = q.Where(exp);
                    }
                
                    return q
                    .Select(x => new DTOLink
                    {
                        date_in = x.date_in,
                        id_link = x.id,
                        link = x.link,
                        user_in = x.user_in,
                        ip = x.ip,
                        controller = x.controller,
                        action = x.action,
                        parameters = x.parameters,
                        query = x.query
                    })
                    .OrderByDescending(x=>x.id_link)
                    .ToList();
            }
        }

        public void SaveLink(UrlClass link)
        {
            using (var _Context = currentContext)
            {
                UserLink add = new UserLink
                {
                    link = link.url,
                    controller = link.controller,
                    action = link.action,
                    query = link.query, 
                    ip = _IP()
                };
                _Context.UserLInks.Add(add);
                try
                {
                    _Context.SaveChanges();
                }
                catch(Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }
            }
        }
    }

    public interface IUserLogRepository
    {
        void SaveLink(UrlClass link);
        List<DTOLink> GetLink(Expression<Func<UserLink, bool>> exp = null);
    }

}
