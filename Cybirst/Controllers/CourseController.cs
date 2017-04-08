using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course/All
        public ActionResult All()
        {
            return View("All");
        }

        // GET: Course/Detail
        public ActionResult Detail()
        {
            return View("Detail");
        }

        // GET: Course/New
        public ActionResult New()
        {
            return View("New");
        }
    }
}