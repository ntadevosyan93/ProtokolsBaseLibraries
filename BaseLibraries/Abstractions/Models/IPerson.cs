using BaseLibraries.Common;
using System;

namespace BaseLibraries.Abstractions.Models
{
    public interface IPerson : IEntity, IPersonBase
    {
        byte? age { get; set; }
        Gender? gender { get; set; }
        string gender_str { get; }
    }

    public interface IPersonBase
    {
        string fio { get; set; }
        DateTime? date_b { get; set; }
    }
}
