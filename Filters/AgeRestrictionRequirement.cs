using Microsoft.AspNetCore.Authorization;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace BiblioWebApi.Filters
{  
        public class AgeRestrictionRequirement : IAuthorizationRequirement
        {
            private int _age;

            public int MinAge {
            get { return _age; }
            protected set { _age = 18; }
           }
        }
    public class TokenAuthenticationHandler : AuthorizationHandler<AgeRestrictionRequirement>
    {
        public IServiceProvider ServiceProvider { get; set; }

        public TokenAuthenticationHandler():base()
        {

        }

        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, AgeRestrictionRequirement requirement)
        {
            if(!context.User.HasClaim(c=>c.Type==ClaimTypes.DateOfBirth))
            {
                throw new 
                    InvalidOperationException("This content is forbidden for " +
                    "whom age under  18 years");
            }
            else
            {
                return Task.Factory.StartNew(
                    new Action(() =>
                    {
                        if (requirement.MinAge > 18) context.Succeed(requirement);
                        else context.Fail();
                    }));
            }
        }
    }
}
