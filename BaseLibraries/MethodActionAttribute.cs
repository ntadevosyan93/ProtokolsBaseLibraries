using System;
using System.Linq;

namespace BaseLibraries
{
    [AttributeUsage(AttributeTargets.Method)]
    public class MethodActionAttribute : Attribute
    {
        private readonly string _actionName;

        /// <summary>
        /// Список NotifyPropertyChange для методов, которые нужно выполнить
        /// </summary>
        /// <param name="actionName"></param>
        public MethodActionAttribute(string actionName, string caption = null)
        {
            _actionName = actionName;
            Caption = caption;
            Order = 999;
        }

        public string[] ActionList {
            get
            {
                return _actionName.Split(new char[] { ' ', ',' }).Where(x => !string.IsNullOrEmpty(x)).ToArray();
            }
        }

        public string Caption { get; }

        public int Order { get; set; }
    }
}
