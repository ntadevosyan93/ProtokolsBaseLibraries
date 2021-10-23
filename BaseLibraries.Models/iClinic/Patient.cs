using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;

namespace BaseLibraries.Models.iClinic
{


    public class Patient : IPatient, IPerson
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }


        [StringLength(9)]
        [ColumnMap("idm_1c")]
        public string idm_1c { get; set; }

        [StringLength(250)]
        [ColumnMap("fio")]
        public string fio { get; set; }


        [ColumnMap("date_b")]
        public DateTime? date_b { get; set; }

        [ColumnMap("gender")]
        public Gender? gender { get; set; }

        [ColumnMap("age")]
        public byte? age { get; set; }

        [StringLength(10)]
        [ColumnMap("pasp_ser")]
        public string pasp_ser { get; set; }

        [StringLength(30)]
        [ColumnMap("pasp_num")]
        public string pasp_num { get; set; }

        [ColumnMap("pasp_date")]
        public DateTime? pasp_date { get; set; }

        [StringLength(250)]
        [ColumnMap("pasp_issued")]
        public string pasp_issued { get; set; }

        [StringLength(250)]
        [ColumnMap("addr_registr")]
        public string addr_registr { get; set; }

        [StringLength(250)]
        [ColumnMap("addr_residential")]
        public string addr_residential { get; set; }

        [StringLength(20)]
        [ColumnMap("phone")]
        public string phone { get; set; }

        [ColumnMap("idm_1c_verstamp")]
        public short? idm_1c_verstamp { get; set; }

        [StringLength(50)]
        [ColumnMap("fam")]
        public string fam { get; set; }

        [StringLength(50)]
        [ColumnMap("name")]
        public string name { get; set; }

        [StringLength(50)]
        [ColumnMap("otch")]
        public string otch { get; set; }

        [ColumnMap("is_vip")]
        public YesNoEnum? is_vip { get; set; }

        public byte? is_non_grata { get; set; }

        [StringLength(50)]
        [ColumnMap("guid")]
        public string guid { get; set; }

        [StringLength(80)]
        [ColumnMap("email")]
        public string email { get; set; }

        [ColumnMap("base_patient")]
        public YesNoEnum? base_patient { get; set; }

        [ColumnMap("date_in")]
        public DateTime? date_in_ { get; set; }

        [ColumnMap("first_visit")]
        public DateTime? first_visit { get; set; }

        [ColumnMap("last_visit")]
        public DateTime? last_visit { get; set; }

        public decimal? total_money { get; set; }

        public string comment { get; set; }

        //TODO Место работы
        [NotMapped()]
        public string job_place { get; set; }

        //TODO Номер страхового
        [NotMapped()]
        public string insurance_num { get; set; }

        [NotMapped()]
        public string gender_str { get {
                return this.GenderAsString();
            }
        }

        [NotMapped()]
        public IAddressData StructedAddress { get; set; }

 
        [NotMapped]
        public List<PatientInsurance> Insurances { get; set; }

        public Patient()
        {
            Insurances = new List<PatientInsurance>();
        }

    }
}
