using BaseLibraries.Abstractions.Models;

namespace BaseLibraries.Common
{
    public static class IPersonHelper
    {
        public static Gender? GetGenderEnumValue(this IPerson person,string gender_str)
        {
            switch (gender_str)
            {
                case "Мужской":
                    return Gender.M;
                case "Женский":
                    return Gender.F;
                default:
                    return null;
            }
        }

        public static string GenderAsString(this IPerson person)
        {
            switch (person.gender)
            {
                case Gender.F:
                    return "Женский";
                case Gender.M:
                    return "Мужской";
                default:
                    return "н/у";
            }

        }
    }
}
