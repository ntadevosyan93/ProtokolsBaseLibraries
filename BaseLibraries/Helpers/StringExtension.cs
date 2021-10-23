
using System.Linq;

namespace BaseLibraries.Helpers
{
    public static class StringExtension
    {
        public static string Translit(this string str)
        {
            string[] lat_up = { "A", "B", "V", "G", "D", "E", "Yo", "Zh", "Z", "I", "Y", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "F", "Kh", "Ts", "Ch", "Sh", "Shch", "", "Y", "", "E", "Yu", "Ya" };
            string[] lat_low = { "a", "b", "v", "g", "d", "e", "yo", "zh", "z", "i", "y", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "kh", "ts", "ch", "sh", "shch", "", "y", "", "e", "yu", "ya" };
            string[] rus_up = { "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я" };
            string[] rus_low = { "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я" };
            for (int i = 0; i <= 32; i++)
            {
                str = str.Replace(rus_up[i], lat_up[i]);
                str = str.Replace(rus_low[i], lat_low[i]);
            }
            str = str.Replace(" ", "_");
            return str;
        }

        public static string NormPhone(this string ph_num)
        {
            if (string.IsNullOrWhiteSpace(ph_num))
                return "";
            //if (ph_num[0] == '+')
            //{
            //    ph_num = new string(ph_num.Skip(1).ToArray());
            //}
            ph_num = ph_num.Replace("-", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace(" ", "").Replace("+7", "7").Replace("+8", "7");

            if (ph_num.Length > 11)
            {
                ph_num = new string(ph_num.Reverse().Take(11).Reverse().ToArray());
            }
            if (ph_num.Length == 10 && ph_num[0] == '9')
            {
                ph_num = "7" + ph_num;
            }
            if (ph_num[0] == '8')
            {
                ph_num = '7' + new string(ph_num.Skip(1).ToArray());
            }
            if (ph_num == "anonymous")
                ph_num = "";


            return ph_num;
        }

    }
}
