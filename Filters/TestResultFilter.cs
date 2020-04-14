//#define declarative 
#define imperative
using Microsoft.AspNetCore.Mvc.Filters;

namespace BiblioWebApi.Filters
{
#if declarative
    public class TestResultFilterAttribute : ResultFilterAttribute
    {
#endif
#if imperative
    public class TestResultFilter : IResultFilter
    {
#endif

        public
 #if declarative
            override
#endif      
         void OnResultExecuting(ResultExecutingContext context)
        {
            //base.OnResultExecuting(context);
        }
        public

#if declarative
            override
#endif

        void OnResultExecuted(ResultExecutedContext context)
        {
            //base.OnResultExecuted(context);
        }

        
    }
}
