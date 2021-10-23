using System;

namespace BaseLibraries.Abstractions.Models
{
    public interface IPeriod
    {
        DateTime begin_date { get; set; }
        DateTime? end_date { get; set; }
    }
}
