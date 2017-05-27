using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Areas.Experts.Controllers
{
    public class HomeController : Controller
    {
        private DataClasses1DataContext dbContext = new DataClasses1DataContext();

        public ActionResult Index()
        {
            Instructor currentUser = (Instructor)System.Web.HttpContext.Current.Session["currentUser"];
            ViewBag.Courses = dbContext.Courses.Where(x => x.InstructorID == currentUser.ID).ToList<Course>();
            return View();
        }

        public ActionResult Search(string keyword)
        {
            ViewBag.Courses = dbContext.Courses.Where(x => x.Name.Contains(keyword)).ToList<Course>();
            return View("Index");
        }

        public ActionResult Faq()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
    }
}