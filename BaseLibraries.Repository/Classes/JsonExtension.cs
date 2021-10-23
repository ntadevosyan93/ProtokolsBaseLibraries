using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Classes
{
    public static class JsonExtension 
    {

    public static FilterTypeGrid GetFilterFromType(this JToken f)
    {
        string type = ((JProperty)f.Last().First()).Name;
        FilterTypeGrid add = null;
        var filtervalue = ((JProperty)f.Last().First()).Value;
        //var filtrValue = (((JProperty)f.Last().First()).Value.ToString() == "(данные отсутствуют)" ? "" : ((JProperty)f.Last().First()).Value.ToString());

        switch (type)
        {
                case "txt":

                    add = new FilterTypeGrid
                    {
                        //field = ((JProperty)f.First.First).Name,
                        type = type,
                        val =  filtervalue.ToString()
                    };
                    break;
                case "id":

                    add = new FilterTypeGrid
                    {
                        //field = ((JProperty)f.First.First).Name,
                        type = type,
                        id = Convert.ToInt32(filtervalue)
                    };
                    break;

                case "cb":

                add = new FilterTypeGrid
                {
                    //field = ((JProperty)f.First.First).Name,
                    type = type,
                    val = (filtervalue.ToString() == "(данные отсутствуют)" ? "" : filtervalue.ToString())
                };
                break;
                case "chkstr":
                    {
                        add = new FilterTypeGrid
                        {
                            type = type,
                            arr = filtervalue.ToObject<string[]>()
                        };
                        break;
                    }

            case "dttwo":
                add = new FilterTypeGrid
                {
                    type = type,
                    //field = ((JProperty)f.First.First).Name,
                    start = Convert.ToDateTime(filtervalue["st"]),
                    stop = Convert.ToDateTime(filtervalue["en"]),
                };
                //filtervalue["st"]
                break;
            case "dtone":
                add = new FilterTypeGrid
                {
                    type = type,
                    //field = ((JProperty)f.First.First).Name,
                    dtone = Convert.ToDateTime(filtervalue)
                };
                //filtervalue["st"]
                break;

        }

        return add;
    }
    }
}


/*


    */