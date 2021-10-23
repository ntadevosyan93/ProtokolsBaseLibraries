using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Abstractions.Models
{
    public interface IAddressData
    {
        string source { get; set; }
        string postal_code { get; set; }
        string country { get; set; }

        string region_fias_id { get; set; }
        string region_kladr_id { get; set; }
        string region_with_type { get; set; }
        string region_type { get; set; }
        string region_type_full { get; set; }
        string region { get; set; }

        string area_fias_id { get; set; }
        string area_kladr_id { get; set; }
        string area_with_type { get; set; }
        string area_type { get; set; }
        string area_type_full { get; set; }
        string area { get; set; }

        string city_fias_id { get; set; }
        string city_kladr_id { get; set; }
        string city_with_type { get; set; }
        string city_type { get; set; }
        string city_type_full { get; set; }
        string city { get; set; }

        string city_area { get; set; }

        string city_district_fias_id { get; set; }
        string city_district_kladr_id { get; set; }
        string city_district_with_type { get; set; }
        string city_district_type { get; set; }
        string city_district_type_full { get; set; }
        string city_district { get; set; }

        string settlement_fias_id { get; set; }
        string settlement_kladr_id { get; set; }
        string settlement_with_type { get; set; }
        string settlement_type { get; set; }
        string settlement_type_full { get; set; }
        string settlement { get; set; }

        string street_fias_id { get; set; }
        string street_kladr_id { get; set; }
        string street_with_type { get; set; }
        string street_type { get; set; }
        string street_type_full { get; set; }
        string street { get; set; }

        string house_fias_id { get; set; }
        string house_kladr_id { get; set; }
        string house_type { get; set; }
        string house_type_full { get; set; }
        string house { get; set; }

        string block_type { get; set; }
        string block_type_full { get; set; }
        string block { get; set; }

        string flat_type { get; set; }
        string flat_type_full { get; set; }
        string flat { get; set; }
        string flat_area { get; set; }
        string square_meter_price { get; set; }
        string flat_price { get; set; }

        string postal_box { get; set; }
        string fias_id { get; set; }
        string fias_level { get; set; }
        string kladr_id { get; set; }
        string capital_marker { get; set; }

        string okato { get; set; }
        string oktmo { get; set; }
        string tax_office { get; set; }
        string tax_office_legal { get; set; }

        string timezone { get; set; }

        string geo_lat { get; set; }
        string geo_lon { get; set; }
        string qc_geo { get; set; }

        string beltway_hit { get; set; }
        string beltway_distance { get; set; }
    }
}
