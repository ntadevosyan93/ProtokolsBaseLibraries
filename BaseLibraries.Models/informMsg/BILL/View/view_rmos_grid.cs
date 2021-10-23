using BaseLibraries.Interfaces.Bill;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
    [Table("dbo.view$rmos_grid")]
    public class view_rmos_grid
    {
        [Key]
        public int id_rm { get; set; }

        public int? idm_billing { get; set; }

        [Display(Name = "Наименование")]
        public string text { get; set; }

        [Display(Name = "Серийный номер")]
        public string serial_num { get; set; }

        [Display(Name = "Инвентарный номер")]
        public string inv_num { get; set; }
        [Display(Name = "Наша организация")]
        public string head_org { get; set; }
        public int? idm_org { get; set; }

        [Display(Name = "Подразделение")]
        public string otdel { get; set; }

        public int? idm_otdel { get; set; }

        [Display(Name = "Поставщик")]
        public string partner { get; set; }

        public int? idm_partner { get; set; }

        [Display(Name = "Дата")]
        public DateTime? doc_date_purchase { get; set; }

        [Display(Name = "Номер")]
        public string doc_num_purchase { get; set; }

        [Display(Name = "Дата")]
        public DateTime? cash_date { get; set; }

        [Display(Name = "Номер")]
        public string cash_number { get; set; }

        [Display(Name = "Дата")]
        public DateTime? receip_date { get; set; }

        [Display(Name = "Номер")]
        public string receip_number { get; set; }

        public int? idm_head_org { get; set; }
        public int? idm_type { get; set; }
    }
}
