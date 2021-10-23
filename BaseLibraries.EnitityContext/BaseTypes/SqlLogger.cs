using System;
using System.Collections.Generic;
using System.IO;

namespace BaseLibraries.EnitityContext.BaseTypes
{
    public class SqlLogger
    {
        string _filepath;
        List<string> _data = new List<string>();

        public void Write(string componet, string message)
        {
            _filepath = $"{Environment.GetFolderPath(Environment.SpecialFolder.Desktop)}\\SQL-{DateTime.Now.ToShortDateString()}-{componet}.txt";
            _data.Add(message);
        }

        public void Close()
        {
            File.WriteAllLines(_filepath, _data);
        }
    }
}
