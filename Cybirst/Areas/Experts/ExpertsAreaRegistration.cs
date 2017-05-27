using System.Web.Mvc;

namespace Cybirst.Areas.Experts
{
    public class ExpertsAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Experts";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Experts_default",
                "Experts/{controller}/{action}/{id}",
                new { action = "Index", controller = "Home", id = UrlParameter.Optional },
                namespaces: new[] { "Cybirst.Areas.Experts.Controllers" }
            );
        }
    }
}