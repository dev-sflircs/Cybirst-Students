using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Courses()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult NewCourses()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult CourseDetail()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult TechnologyDetail()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Lession()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Instructors()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult InstructorDetail()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Profile()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}