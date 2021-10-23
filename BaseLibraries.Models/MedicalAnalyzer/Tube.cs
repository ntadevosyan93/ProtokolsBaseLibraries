using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Threading.Tasks;

namespace BaseLibraries.Models.MedicalAnalyzer
{
    public class Tube
    {
        [Key]
        [ColumnMap(nameof(id))]
        public int id { get; set; }

        [ColumnMap(nameof(id_1c))]
        public string id_1c { get; set; }

        [ColumnMap(nameof(barcode))]
        public string barcode { get; set; }

        [ColumnMap(nameof(idm_tasks))]
        public int? idm_tasks { get; set; }

        [ColumnMap(nameof(date_in))]
        public DateTime? date_in { get; set; }

        [ColumnMap(nameof(source_id))]
        public int? source_id { get; set; }

        [ColumnMap(nameof(autocreate))]
        public byte? autocreate { get; set; }

        [ColumnMap(nameof(idm_color))]
        public int? idm_color { get; set; }

        [ColumnMap(nameof(date_admission_lab))]
        public DateTime date_admission_lab { get; set; }

        [ColumnMap(nameof(source_txt))]
        public string source_txt { get; set; }

        [ColumnMap(nameof(idm_biomaterial))]
        public int? idm_biomaterial { get; set; }

        [ColumnMap(nameof(date_waiting))]
        public DateTime? date_waiting { get; set; }

        [ColumnMap(nameof(Medlinx_specimen_code))]
        public string Medlinx_specimen_code { get; set; }

        [ForeignKey(nameof(idm_tasks))]
        public virtual Task TaskRef { get; set; }

    }
}
