using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace BaseLibraries.Models.iClinic.Views
{
    public class ProtocolDocument
    {
        public Tasks Task { get; set; }
        public Employee Employee { get; set; }
        public Patient Patient { get; set; }
        public Services Services { get; set; }
        public Spec Spec { get; set; }
        public Places Places { get; set; }
    }
}
