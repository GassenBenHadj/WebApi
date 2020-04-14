using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Diagnostics;
using System.Threading.Tasks;
namespace BiblioWebApi.Filters
{
    [AttributeUsage(AttributeTargets.Class|AttributeTargets.Method)]
    public class ResultAddHeaderAsyncAttribute : ResultFilterAttribute
    {
        private readonly string _name;
        private readonly string _value;

        public ResultAddHeaderAsyncAttribute(string name, string value)
        {
            _name = name;
            _value = value;
        }
        async public override Task OnResultExecutionAsync(
            ResultExecutingContext context,
            ResultExecutionDelegate next)
        {
            Debug.WriteLine("Direction requête");
            Task task = Task.Factory.StartNew(new System.Action(
                () => 
                    {
                        context.HttpContext.Response.Headers.Add(_name, new string[] { _value });
                        base.OnResultExecuting(context);
                    }
                    ));
            await next();
            Debug.WriteLine("Direction reponse");
        }

        
    }
}



