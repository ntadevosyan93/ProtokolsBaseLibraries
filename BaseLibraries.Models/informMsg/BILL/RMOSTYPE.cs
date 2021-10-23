using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Models.informMsg.BILL
{
 
    [Table("dbo.RM$OS$TYPE")]
    public class RMOSTYPE
    {
    [Key]
    public int id { get; set; }

    public string text { get; set; }

    public int? parent_id { get; set; }

}
}
