//#define declarative 
#define imperative
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Web.Http.Filters;

namespace BiblioWebApi.Filters
{

#if declarative
    public class TestRessourceFilterAttribute :Attribute, IResourceFilter
    {
#endif

#if imperative
        public class TestRessourceFilter : IResourceFilter
    {
#endif
        public void OnResourceExecuted(ResourceExecutedContext context)
        {
            throw new System.NotImplementedException();
        }

        public void OnResourceExecuting(ResourceExecutingContext context)
        {
            throw new System.NotImplementedException();
        }
    }
}
