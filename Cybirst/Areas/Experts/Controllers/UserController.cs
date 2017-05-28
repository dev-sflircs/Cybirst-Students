using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Areas.Experts.Controllers
{
    public class UserController : Controller
    {

        private DataClasses1DataContext dbContext = new DataClasses1DataContext();

        // GET: User
        public ActionResult Profile()
        {
            try
            {
                Instructor currentUser = (Instructor)System.Web.HttpContext.Current.Session["currentUser"];
                Instructor instructorDetail = dbContext.Instructors.Where(x => x.ID == currentUser.ID).FirstOrDefault();
                return View(instructorDetail);
            }
            catch (Exception e)
            {
                return RedirectToAction("NotFound", "ErrorHandler");
            }
        }

        public ActionResult UpdateProfile()
        {
            return View();
        }

        // GET: User/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: User/Create
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

        // GET: User/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: User/Edit/5
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

        // GET: User/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: User/Delete/5
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
