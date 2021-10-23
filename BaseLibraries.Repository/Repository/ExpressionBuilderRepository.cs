using BaseLibraries.Repository.Classes;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Diagnostics;

namespace BaseLibraries.Repository.Repository
{
    public class ExpressionBuilderRepository : IExpressionBuilderRepository
    {
        class SwapVisitor : ExpressionVisitor
        {
            private readonly Expression from, to;
            public SwapVisitor(Expression from, Expression to)
            {
                this.from = from;
                this.to = to;
            }
            public override Expression Visit(Expression node)
            {
                return node == from ? to : base.Visit(node);
            }
        }
        //


        public List<FilterTypeGrid> GetListFilterGrid(string list_filter)
        {
            List<FilterTypeGrid> lst = new List<FilterTypeGrid>();
            if (list_filter == null)
                return lst;
            try
            {
                JArray jArray = JArray.Parse("[" + list_filter + "]");
                foreach (var f in jArray.First.Where(x => x.Last.ToString() != ""))
                {
                    FilterTypeGrid ins = GetFilterFromType(f);
                    if(ins!=null)
                    lst.Add(ins);
                }

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            return lst;
        }

        public FilterTypeGrid GetFilterFromType(JToken f)
        {
            string type = ((JProperty)f.Last().First()).Name;
            FilterTypeGrid add = null;
            var filtervalue = ((JProperty)f.Last().First()).Value;
            //var filtrValue = (((JProperty)f.Last().First()).Value.ToString() == "(данные отсутствуют)" ? "" : ((JProperty)f.Last().First()).Value.ToString());

            switch (type)
            {
                case "txt":
                    {
                        add = new FilterTypeGrid
                        {
                            field = ((JProperty)f).Name,
                            type = type,
                            val = filtervalue.ToString()
                        };
                        break;
                    }
                case "cb":
                    
                    add = new FilterTypeGrid
                    {
                        field = ((JProperty)f).Name,
                        type = type,
                        val = (filtervalue.ToString() == "(данные отсутствуют)" ? "" : filtervalue.ToString())
                    };
                    break;
                case "dttwo":
                    add = new FilterTypeGrid
                    {
                        type = type,
                        field = ((JProperty)f).Name,
                        start = Convert.ToDateTime(filtervalue["st"]),
                        stop = Convert.ToDateTime(filtervalue["en"]),
                    };
                    //filtervalue["st"]
                    break;
                case "dtone":
                    add = new FilterTypeGrid
                    {
                        type = type,
                        field = ((JProperty)f).Name,
                        dtone = Convert.ToDateTime(filtervalue)
                    };
                    //filtervalue["st"]
                    break;
                case "id":
                    add = new FilterTypeGrid
                    {
                        type = type,
                        param = filtervalue["type"].ToString(),
                        field = ((JProperty)f).Name,
                        id = Convert.ToInt32(filtervalue["val"])
                    };
                    break;
                case "chkstr":
                    var arr = filtervalue.ToObject<string[]>();
                    if(arr.Any())
                    add = new FilterTypeGrid
                    {
                        type = type,
                        field = ((JProperty)f).Name,
                        arr = arr
                    };
                    break;
            }

            return add;
        }

        public Expression<Func<T, bool>> GetExpression<T>(string list_filter)
        {
            Expression<Func<T, bool>> e1 = null;
            if (list_filter == null)
                return null;
            try
            {
                JArray jArray = JArray.Parse("[" + list_filter + "]");
                foreach (var f in jArray.First.Where(x => x.Last.ToString() != ""))
                {
                    var fitrName = ((JProperty)f).Name;
                    PropertyInfo inf = typeof(T).GetProperties().FirstOrDefault(property => property.Name == fitrName);
                    var filtrValue = (f.Last.ToString() == "(данные отсутствуют)" ? "" : f.Last.ToString());
                    
                    PropertyInfo inf2 = typeof(T).GetProperties().FirstOrDefault(property => property.Name == fitrName);
                    var e2 = ETForString<T>(filtrValue, inf2);


                    if (e1 == null)
                        e1 = e2;
                    else
                        e1 = Expression.Lambda<Func<T, bool>>(Expression.AndAlso(
                        new SwapVisitor(e1.Parameters[0], e2.Parameters[0]).Visit(e1.Body),
                        e2.Body), e2.Parameters);
                }


            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            return e1;
        }

        public Expression<Func<T, bool>> GetExpression<T>(List<FilterTypeGrid> lst)
        {
            Expression<Func<T, bool>> e1 = null;

            try
            {
                foreach (var f in lst)//.Where(x=>x.type == "cb"))
                {
                    PropertyInfo inf2 = typeof(T).GetProperties().FirstOrDefault(property => property.Name == f.field);

                    Expression<Func<T, bool>> e2 = null;

                    switch(f.type)
                        {
                        case "txt":
                            e2 = ETForString<T>(f.val, inf2,"Contains");
                            break;
                        case "cb":
                            e2 = ETForString<T>(f.val, inf2);
                            break;
                        case "dtone":
                            e2 = ETForDateTime<T>(f, inf2);
                            break;
                        case "dttwo":
                            e2 = ETForDateTimeTwo<T>(f, inf2);
                            break;
                        case "id":
                            {

                                e2 = ETForId<T>(f, inf2);
                                break;
                            }
                        case "chkstr":
                            e2 = ETForStringArrayEquals<T>(f, inf2);
                            break;
                        default:
                            return e1;
                    }
                    


                    if (e1 == null)
                        e1 = e2;
                    else
                        e1 = Expression.Lambda<Func<T, bool>>(Expression.AndAlso(
                        new SwapVisitor(e1.Parameters[0], e2.Parameters[0]).Visit(e1.Body),
                        e2.Body), e2.Parameters);
                }


            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            return e1;
        }

        Expression<Func<T, bool>> ETForString<T>(string propertyValue, PropertyInfo propertyInfo, string method = "Equals")
        {
            ParameterExpression e = Expression.Parameter(typeof(T), "e");
            MemberExpression m = Expression.MakeMemberAccess(e, propertyInfo);
            ConstantExpression c = Expression.Constant(propertyValue, typeof(string));
            MethodInfo mi = typeof(string).GetMethod(method, new Type[] { typeof(string) });
            Expression call = Expression.Call(m, mi, c);

            Expression<Func<T, bool>> lambda = Expression.Lambda<Func<T, bool>>(call, e);
            return lambda;
        }

        private static Expression NotEqual(Expression memberExpression,
                                   ConstantExpression constantToCompare)
        {
            // Other cases removed, for simplicity. This answer only demonstrates
            // how to handle c => c.Weight != 5000f.
            var valueExpression = Expression.Property(memberExpression, "Value");
            try
            {
                var hasValueExpression = Expression.Property(memberExpression, "HasValue");
                
                var notEqual = Expression.Equal(valueExpression, constantToCompare);
                return Expression.AndAlso(hasValueExpression, notEqual);
            }
            catch
            {
                return valueExpression;
            }
        }

        Expression<Func<T, bool>> ETForId<T>(FilterTypeGrid propertyValue, PropertyInfo propertyInfo, string method = "Equals")
        {
            ParameterExpression e = Expression.Parameter(typeof(T), "e");
            MemberExpression m = Expression.MakeMemberAccess(e, propertyInfo);
            ConstantExpression c = Expression.Constant(propertyValue.id, typeof(int));

            try
            {
                MethodInfo mi = typeof(int).GetMethod(method, new Type[] { typeof(int) });
                Expression call = Expression.Call(m, mi, c);
                Expression<Func<T, bool>> lambda;
                if (propertyValue.param == "eq")
                {
                    lambda = Expression.Lambda<Func<T, bool>>(call, e);

                }
                else
                {
                    lambda = Expression.Lambda<Func<T, bool>>(Expression.Not( call), e);
               
                }
                return lambda;
            }
            catch
            {
                var weightNotEqualExpression = NotEqual(m, c);


                //

                //var cc =Expression.Convert(Expression.Constant(propertyValue.id), typeof(int));

                //Expression call = Expression.Call(m, mi, c);
                //Expression where = Expression.GreaterThanOrEqual(column, Expression.Convert(Expression.Constant(value), column.Type));
                Expression<Func<T, bool>> lambda = Expression.Lambda<Func<T, bool>>(weightNotEqualExpression, e);
                return lambda;
            }
        }

        Expression<Func<T, bool>> ETForStringArrayEquals<T>(FilterTypeGrid propertyValue, PropertyInfo propertyInfo, string method = "Equals")
        {
            ParameterExpression e = Expression.Parameter(typeof(T), "e");
            MemberExpression m = Expression.MakeMemberAccess(e, propertyInfo);

            Expression ret = null;

            foreach (var f in propertyValue.arr)
            {

                ConstantExpression c = Expression.Constant(f, typeof(string));
                MethodInfo mi = typeof(string).GetMethod(method, new Type[] { typeof(string) });
                Expression call = Expression.Call(m, mi, c);

                if (ret == null)
                    ret = call;
                else
                    ret = Expression.Or(ret, call);

            }
            return Expression.Lambda<Func<T, bool>>(ret, e); 

        }

        Expression<Func<T, bool>> ETForDateTimeTwo<T>(FilterTypeGrid propertyValue, PropertyInfo propertyInfo, string method = "Equals")
        {

            ParameterExpression e = Expression.Parameter(typeof(T), "e");
            MemberExpression m = Expression.MakeMemberAccess(e, propertyInfo);
            ConstantExpression c = Expression.Constant(propertyValue.start.Value.Date, typeof(DateTime?));
            Expression call = Expression.GreaterThanOrEqual(m, c);

            ConstantExpression c2 = Expression.Constant(propertyValue.stop.Value.AddDays(1), typeof(DateTime?));
            Expression call2 = Expression.LessThan(m,c2);

            var ret = Expression.And(call, call2);

            return Expression.Lambda<Func<T, bool>>(ret, e); 

        }

        Expression<Func<T, bool>> ETForDateTime<T>(FilterTypeGrid propertyValue, PropertyInfo propertyInfo, string method = "Equals")
        {

            ParameterExpression e = Expression.Parameter(typeof(T), "e");
            MemberExpression m = Expression.MakeMemberAccess(e, propertyInfo);



            var ce = Expression.Convert(m, typeof(DateTime?));
            MethodCallExpression mc = Expression.Call(null, typeof(DbFunctions).GetMethod("TruncateTime", new Type[] { typeof(DateTime?) }), ce);
            ConstantExpression constant = Expression.Constant(propertyValue.dtone, typeof(DateTime?));
            BinaryExpression body = Expression.Equal(mc, constant);


            return Expression.Lambda<Func<T, bool>>(body, e);
            //Expression<Func<T, bool>> funcExpression = (Expression<Func<T, bool>>)isEqualExpressionTree;
        }

        public string GetModelToVueString<T>()
        {
            var model = typeof(T);

            string ret = "";

            foreach (PropertyInfo propInfo in model.GetProperties())
            {
                ret = ret + string.Format(" {0}:'', \n", propInfo.Name);
            }
            return ret;
        }

    }
    public interface IExpressionBuilderRepository
    {
        Expression<Func<T, bool>> GetExpression<T>(string list_filter);

        Expression<Func<T, bool>> GetExpression<T>(List<FilterTypeGrid> lst);

        List<FilterTypeGrid> GetListFilterGrid(string list_filter);
        //Expression<Func<InformFILE_STOR, bool>> GetExpression(string filter);
        string GetModelToVueString<T>();
    }
}
