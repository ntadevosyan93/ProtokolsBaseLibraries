using BaseLibraries.Interfaces;
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
    [Table("dbo.RM$OS")]
    public class RMOS:IHistory, IRSMOSUpdate, IDel, IDel_byte
    {
        [Key]
        public int id { get; set; }

        [NotMapped]
        public int id_rm
        {
            get { return id; }
            set { id = value; }
        }
        public DateTime? date_in { get; set; }

        public string user_in { get; set; }

        [Display(Name = "Наша организация")]
        public int? idm_org { get; set; }

        [Display(Name = "Тип")]
        public int? idm_type { get; set; }

        public int? idm_addr { get; set; }

        public int? idm_mol { get; set; }

        public string place { get; set; }

        [Display(Name = "Наименование")]
        public string text { get; set; }

        public DateTime? date_start { get; set; }

        [Display(Name = "Серийный номер")]
        public string serial_num { get; set; }

        [Display(Name = "Инвентарный номер")]
        public string inv_num { get; set; }

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

        [Display(Name = "Поставщик")]
        public int? idm_partner { get; set; }

        [Column("del")]
        public byte m_del { get; set; }

        [NotMapped]
        public bool del {
            get
            {
                return m_del == 1;
            }
            set
            {
                m_del = (byte)(value?1:0) ;
            }
        }
        public int? idm_invoice { get; set; }

        [Display(Name = "Статус")]
        public int? status { get; set; }

        public int? idm_partner_service { get; set; }

        public string inv_num_extended { get; set; }

        [Display(Name = "Наша организация")]
        public int? idm_head_org { get; set; }

        [Display(Name = "Подразделение")]
        public int? idm_otdel { get; set; }

        [Display(Name = "М.О.Л.")]
        public int? idm_responsible { get; set; }

        public string user_cor { get; set; }

        public DateTime? date_cor { get; set; }

        [NotMapped]
        public string user_cur { get { return user_cor; } set { user_cor = value; } }

        [NotMapped]
        public DateTime? date_cur { get { return date_cor; } set { date_cor = value; } }

        public short? date_release { get; set; }

        public DateTime? date_expired { get; set; }

        public DateTime? date_check { get; set; }

        public int? idm_priority { get; set; }

        public int? idm_billing { get; set; }

        [Display(Name = "Кабинет")]
        public int? idm_depart_offices { get; set; }

        public string guid { get; set; }

    }

}
