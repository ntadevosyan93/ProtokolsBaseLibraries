using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.PriceSRV
{
    /// <summary>
    /// Правило скидки
    /// </summary>
    public class DiscountRule
    {
        [Key]
        public int id { get; set; }

        public int? idm_discount_list { get; set; }

        public string db_name { get; set; }

        public string procedure { get; set; }


        /// <summary>
        /// область действия
        /// </summary>
        public CriteriaType area { get; set; }
        
        /// <summary>
        /// Тип правила
        /// </summary>
        public RuleType type { get; set; }

        /// <summary>
        /// Напрвление (увелить\уменьшить)
        /// </summary>
        public MathDirection direction { get; set; }

        /// <summary>
        /// Знаменатель
        /// </summary>
        public Denominator denominator { get; set; }

        /// <summary>
        /// Значение
        /// </summary>
        public decimal value { get; set; }

        /// <summary>
        /// Наименовние
        /// </summary>
        public string name { get; set; }

        [ForeignKey("idm_discount_list")]
        public virtual DiscountList Discount { get; set; }

        public override string ToString()
        {
            return name;
        }

    }


    
}
