using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FirstASPNETWebApp.Startup))]
namespace FirstASPNETWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
