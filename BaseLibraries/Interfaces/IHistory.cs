using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Interfaces
{

    public interface IHistory: IId, ICreate, IModify
    {

    }

    public interface  ICreate:IId
    {

        string user_in { get; set; }
        DateTime? date_in { get; set; }
    }

    public interface IModify: IId
    {

        string user_cur { get; set; }
        DateTime? date_cur { get; set; }
    }



    public interface IDel: IId
    {
        bool del { get; set; }
    }
    public interface IDel_byte : IId
    {
        byte m_del { get; set; }
    }
    public interface IDeleted: IId
    {
        string user_del { get; set; }
        DateTime? date_del { get; set; }
    }
}
