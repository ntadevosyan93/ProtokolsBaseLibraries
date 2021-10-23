using System;
using System.ComponentModel;
using BaseLibraries.Abstractions.Models;
using BaseLibraries.Helpers;
using BaseLibraries.Interfaces;

namespace BaseLibraries.Models.iClinic.Reports
{
    public class Patient : IPremitive
    {
        [ReportField("Данные ФИО",true)]
        public Person Person { get; set; }

        [ReportField("Адрес регистрации")]
        public string addr_registr { get; set; }

        [ReportField("Место работы")]
        public string job_place { get; set; }

        [ReportField("Должность")]
        public string position { get; set; }

        [ReportField("Контактный телефон")]
        public string phone { get; set; }

        [ReportField("Адрес регистрации (структуированный)",true)]
        public Address AddrStucted { get; set; }

        [ReportField("Адрес регистрации")]
        public string addr_reg { get; set; }

        public Patient()
        {
            Person = new Person();
            AddrStucted = new Address();
        }
    }
}
