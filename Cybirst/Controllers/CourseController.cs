using Cybirst.DAL.Adapters;
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
        private DataAdapter dataAdapter;
        public CourseController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Course/All
        public ActionResult All()
        {
            List<Technology> lstTechnology = dataContext.Technologies.ToList<Technology>();
            ViewBag.Technologies = lstTechnology;
            return View("All");
        }

        // GET: Course/Detail
        public ActionResult Detail(int uid)
        {
            try
            {
                Course course = dataContext.Courses.Where(x => x.ID == uid).FirstOrDefault();
                ViewBag.Course = dataAdapter.Chain(course);
                return View("Detail");
            } catch (Exception e)
            {
                return HttpNotFound("Cannot find your course!");
            }
        }

        // GET: Course/New
        public ActionResult New()
        {
            return View("New");
        }
    }
}