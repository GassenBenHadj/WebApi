//#define decalartive
#define imperative
using System.Buffers;
using System.IO.Pipelines;
using System.Text;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BiblioWebApi.Filters
{
#if decalartive    
    [AttributeUsage(AttributeTargets.Method)]
     public class TestActionFilterAttribute : ActionFilterAttribute
    {
        private ReadResult _result;
        public TestActionFilterAttribute()
            {
                  //Intialiser les objets ici
            }
#endif

#if imperative
    public class TestActionFilter : IActionFilter
    { 
        private ReadResult _result;
        public TestActionFilter()
        {
            //Intialiser les objets ici
        }
#endif




        public
#if decalartive
       override
#endif  
        void OnActionExecuted(ActionExecutedContext context)
        {
            //Intercepter la réponse
            var response = context.HttpContext.Response;
            //Intercepter le statutcode
            var statutcode = response.StatusCode;      
        }

        public
#if decalartive
       override
#endif       
        void OnActionExecuting(ActionExecutingContext context)
        {
            //Intercepter la requête
            var request = context.HttpContext.Request;
            var reader = request.BodyReader;
            bool canread = reader.TryRead(out _result);
            if(canread)
            {
                var buffer = _result.Buffer;
                var bodyString = ToString(buffer,Encoding.UTF8);
            }
            if(request.HttpContext.Request.Headers.Count>0)
            {
                var headers = request.HttpContext.Request.Headers;
                foreach (var item in headers)
                {
                    //Intercepter les entêtes
                }
            }
            
        }

        private string ToString(ReadOnlySequence<byte> buffer, 
            Encoding encoding)
        {
            if (buffer.IsSingleSegment)
            {
                return encoding.GetString(buffer.First.Span);
            }

            return string.Create((int)buffer.Length, buffer, (span, sequence) =>
            {
                foreach (var segment in sequence)
                {
                    encoding.GetChars(segment.Span, span);
                    span = span.Slice(segment.Length);
                }
            });
        }
    }
}

