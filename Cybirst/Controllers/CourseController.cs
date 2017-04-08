using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class CourseController : Controller
    {
        private DataClasses1DataContext dataContext;
        public CourseController()
        {
            dataContext = new DataClasses1DataContext();
        }
            

        // GET: Course/All
        public ActionResult All()
        {
            List<Technology> lstTechnology = dataContext.Technologies.ToList<Technology>();
            ViewBag.Technologies = lstTechnology;
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