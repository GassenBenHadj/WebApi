//#define filter_imperative
//#define formatters
//#define authorization
#region namespaces
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using BiblioModel.DAL.Interfaces;
using BiblioModel.DAL.Implementations;
using BiblioModel.Models;
using Microsoft.EntityFrameworkCore;
using BiblioWebApi.Filters;
using System.Web.Http.Filters;
#endregion

namespace BiblioWebApi
{
    public class Startup
    {
        private readonly string connectionstring = @"Data Source=PC2020\BI2020;Initial Catalog = BiblioDBV2;" +
                                                                "Integrated Security=True";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
           services.AddControllers();
           services.AddCors();
           
#if filter_imperative
           /* services.AddTransient<TestActionFilter>();
            services.AddTransient<TestAuthorizationFilter>();
            services.AddMvc(options =>
            {
                options.Filters.AddService<TestActionFilter>();
                options.Filters.AddService<TestAuthorizationFilter>();
            }
            ); ;*/
#endif
#if formatters
            services.AddControllers()
                .AddXmlSerializerFormatters();
#endif

            services.AddDbContext<BiblioDBContext>(options => options
            .UseSqlServer(connectionstring));
            /*.UseLazyLoadingProxies());*/
            services.AddScoped(typeof(IVisiteurRepository), typeof(VisitieurRepository));
            services.AddScoped(typeof(ILivreRepository), typeof(LivreRepository));

            services.AddAuthentication();
#if authorization
            /*services.AddAuthorization(options =>
            {
                options.AddPolicy("AgePolicy", policy =>
                 {
                     policy.AddRequirements(new AgeRestrictionRequirement());
                 });
            });*/
#endif


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
           


            app.UseFileServer();
            app.UseRouting();
            //app.UseAuthentication();
            //app.UseAuthorization();

            app.UseCors(b=>b.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
