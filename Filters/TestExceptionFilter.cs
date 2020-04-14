//#define declarative
#define imperative
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
namespace BiblioWebApi.Filters
{
#if declarative
    public class TestExceptionFilterAttribute : ExceptionFilterAttribute
    {
#endif
#if imperative
    public class TestExceptionFilterAttribute :IExceptionFilter
    {
#endif
    private readonly ILogger _logger;   
        public TestExceptionFilterAttribute(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger("CustomOneLoggingExceptionFilter");
        }

#if imperative
        public bool AllowMultiple => true;

        public Task ExecuteExceptionFilterAsync(HttpActionExecutedContext actionExecutedContext, CancellationToken cancellationToken)
        {
            return Task.Factory.StartNew(
                new System.Action(() =>
                {
                    _logger.LogInformation("OnException");
                }));
        }
#endif

     
#if declarative
          public override void OnException(HttpActionExecutedContext actionExecutedContext)
        {
            _logger.LogInformation("OnException");
            base.OnException(actionExecutedContext);
        }
#endif
    }
}
