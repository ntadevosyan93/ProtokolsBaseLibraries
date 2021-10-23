using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.PriceSRV
{
    public class DiscountEmployee
    {
        [Key]
        public int id { get; set; }
        public DateTime? date_in { get; set; }
        public string user_in { get; set; }
        public int? idm_discount_list { get; set; }
        public string id_1c { get; set; }
        public int? id_iclinic { get; set; }
        public string fio { get; set; }
        public DateTime? date_cur { get; set; }
        public string user_cur { get; set; }

        [ForeignKey("idm_discount_list")]
        public virtual DiscountList Discount { get; set; }

        public override string ToString()
        {
            return fio;
        }
    }
}
