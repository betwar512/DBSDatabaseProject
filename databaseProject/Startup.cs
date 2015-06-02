using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(databaseProject.Startup))]
namespace databaseProject
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
