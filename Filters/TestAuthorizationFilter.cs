//#define declarative
#define imperative
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BiblioWebApi.Filters
{
#if declarative
    public class TestAuthorizationFilter : AuthorizationFilterAttribute
    {
#endif
#if imperative
    public class TestAuthorizationFilter : IAuthorizationFilter
    {
#endif
#if imperative
        public bool AllowMultiple => true;
#endif

        public
#if declarative
            override
#endif
        void OnAuthorization(AuthorizationFilterContext context)
        {
           var host = context.HttpContext.Request.Headers["Host"];


            bool isAuthorized=false;
            if (!string.IsNullOrEmpty(host))
            { 
                isAuthorized = CheckUserPermission(host); 
            }
            if (!isAuthorized)
            {
                context.Result = new UnauthorizedResult();
            }
        }
        private bool CheckUserPermission(string user)
        {
            // Logic for checking the user permission goes here. 
            if (user.Equals("localhost:5002"))
                return true;
            // Let's assume this user has only read permission.
            return false;
        }
    }
}

