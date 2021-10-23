using AutoMapper;
using BaseLibraries.Interfaces;
using BaseLibraries.Models.informMsg;
using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.Core;
using BaseLibraries.Repository.DTO;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Repository
{
    public class MessageRepository : BaseSettings,IMessageRepository
    {
        public event Action<string> add_mess;
        public event Action<string> upd_mess;
        public event Action<string> del_mess;

        public MessageRepository(  Func<string> IP = null)
        {
              _IP = IP;
        }

        Func<string> _IP { get; set; }


        public bool SubmitChanges(DTOMessage item, string module, string db_table)
        {
            using (var _Context = currentContext)
            {
                if (item.guid != null)
                {
                    var msg = _Context.MSGMAINs
                        .Where(x => x.guid == item.guid)
                        .FirstOrDefault();
                    if (msg == null)
                        return false;
                    else
                        msg.text = item.text;
                    try
                    {
                        _Context.SaveChanges();
                        upd_mess?.Invoke(item.guid);
                    }
                    catch
                    {
                        return false;
                    }
                    return true;
                }
                else
                {
                    try
                    {
                    MSGMAIN ins = new MSGMAIN
                    {
                        db_table = db_table,
                        module = module,
                        db_table_id = item.id,
                        del = 0,
                        guid = Guid.NewGuid().ToString().ToUpper(),
                        ip_in = _IP(),
                        text = item.text,
                        
                    };

                    _Context.MSGMAINs.Add(ins);

                    _Context.SaveChanges();
                    add_mess?.Invoke(ins.guid);

                    }
                    catch
                    {
                        return false;
                    }
                    return true;
                }
            }
        }

        public List<DTOMessage> GetMessage(string db_table, int id)
        {
            using (var _Context = new TemplateContext())
            {
                var config = new MapperConfiguration(cfg =>
                {
                    cfg.CreateMap<MSGMAIN,DTOMessage>();
                });
                //Настройка AutoMapper
                var mapper = new Mapper(config);

                //config.RecognizeDestinationPrefixes("Cust_"); 
                List<MSGMAIN> mess_list = _Context.MSGMAINs
                    .Where(x => x.db_table == db_table && x.db_table_id == id && x.del == 0)
                    .OrderByDescending(x=>x.date_in)
                    .ToList();
                try
                {
                    var ret = mapper.Map<List<MSGMAIN>, List<DTOMessage>>(mess_list).OrderByDescending(x => x.date_in).ToList();
                    return ret;
                }
                catch(Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                    return null;
                }

               
            }
        }
        public bool RemoveMessage(string db_table, string guid)
        {
            using (var _Context = new TemplateContext())
            {
                var del_message = _Context.MSGMAINs
                    .Where(x => x.db_table == db_table && x.guid == guid && x.del==0).FirstOrDefault();
                if (del_message == null)
                    return false;
                else
                {
                    del_message.del = 1;

                    try
                    {
                        _Context.SaveChanges();

                        del_mess?.Invoke(guid);
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        }
    }

    public interface IMessageRepository
    {
        event Action<string> add_mess;
        event Action<string> upd_mess;
        event Action<string> del_mess;

        bool SubmitChanges(DTOMessage item, string module, string db_table);
        List<DTOMessage> GetMessage(string db_table, int id);
        bool RemoveMessage(string db_table, string guid);
    }
}
