using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Classes
{
    public class UserOptions
    {
         
        public string CurrentUser { get
            {
                var lst = new string[] { "VIPCG\\ya.shono", "VIPCG\\n.sibiryakov", "VIPCG\\i.novokreshchenova" };
                if (lst.Contains(UserName))
                {
                    return ((
                        string.IsNullOrWhiteSpace(AddUser)
                        ) ? (UserName) : AddUser);
                }
                else
                    return UserName;
            }
        }
        public string UserName { get; set; }
        public string AddUser { get; set; }
    }
}
