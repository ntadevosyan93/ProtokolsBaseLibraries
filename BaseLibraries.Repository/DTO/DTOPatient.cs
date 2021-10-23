using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using BaseLibraries.Repository.Classes;

namespace BaseLibraries.Repository.DTO
{

        public class DTOPatient
        {
            [Key]
            [ColumName("id")]
            public int id { get; set; }

            [ColumName("guid")]
            public int guid { get; set; }

            [ColumName("fio")]
            public string fio { get; set; }

            [ColumName("age")]
            public int age { get; set; }

            [ColumName("date_b")]
            public DateTime? date_b { get; set; }
        }
    
}
