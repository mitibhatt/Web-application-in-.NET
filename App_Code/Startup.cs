using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeveloperForum.Startup))]
namespace DeveloperForum
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
