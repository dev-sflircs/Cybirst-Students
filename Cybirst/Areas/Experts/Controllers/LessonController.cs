using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Areas.Experts.Controllers
{
    public class LessonController : Controller
    {
        private DataClasses1DataContext dbContext = new DataClasses1DataContext();

        // GET: Experts/Lesson
        [ChildActionOnly]
        public ActionResult Index(int courseid)
        {
            Course cs = dbContext.Courses.Where(x => x.ID == courseid).FirstOrDefault();
            List<Lesson> ls = cs.Lessons.ToList();
            ViewBag.Lessons = ls;
            return View();
        }

        // GET: Experts/Lesson/Details/5
        [ChildActionOnly]
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Experts/Lesson/Create
        [ChildActionOnly]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Experts/Lesson/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Experts/Lesson/Edit/5
        [ChildActionOnly]
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Experts/Lesson/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Experts/Lesson/Delete/5
        [ChildActionOnly]
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Experts/Lesson/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
