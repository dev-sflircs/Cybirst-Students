using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class Instructor
    {
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string Description { get; set; }
        public string[] Teaching { get; set; }
    } 

    public class LandingPageController : Controller
    {

        List<Instructor> _Instructors = new List<Instructor>()
        {
            new Instructor()
            {
                Name = "Tran Duy Hung",
                Avatar = @"~/Images/956631.jpeg",
                Description = "Working at Facebook on React. Creator of Redux. 1",
                Teaching = new string[]{"Reactjs", "Reduct" }
            },
            new Instructor()
            {
                Name = "Tran Duy Hung",
                Avatar = @"~/Images/9VsY9i09.jpeg",
                Description = "Working at Facebook on React. Creator of Redux. 2",
                Teaching = new string[]{"Reactjs", "Angular" }
            },
            new Instructor()
            {
                Name = "Tran Duy Hung",
                Avatar = @"~/Images/9VsY9i09.jpeg",
                Description = "Working at Facebook on React. Creator of Redux. 3",
                Teaching = new string[]{"Reactjs", "Angular2" }
            },
            new Instructor()
            {
                Name = "Tran Duy Hung",
                Avatar = @"~/Images/9VsY9i09.jpeg",
                Description = "Working at Facebook on React. Creator of Redux. 4",
                Teaching = new string[]{"Reactjs"}
            }
        };

        [ChildActionOnly]
        public ActionResult TaughtByLeaders()
        {
            ViewBag.Instructors = _Instructors;

            return PartialView("TaughtByLeaders");
        }

        // GET: LandingPage
        public ActionResult Index()
        {
            return View();
        }
    }
}