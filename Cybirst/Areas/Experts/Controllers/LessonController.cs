using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Areas.Experts.Controllers
{
    public class LessonModel
    {
        public int  ID { get; set; }
        
        public int  CourseID { get; set; }

        public string Name { get; set; }
    
        public string Intro { get; set; }

        public int EstimatedTime { get; set; }

        public string Video { get; set; }

        public int Order { get; set; }

        public bool IsPro { get; set; }
    }

    public class LessonController : Controller
    {
        private DataClasses1DataContext dbContext = new DataClasses1DataContext();
        private static int CourseID { get; set; }

        // GET: Experts/Lesson
        public ActionResult Index(int id)
        {
            try
            {
                Lesson lessonDetail = dbContext.Lessons.Where(x => x.ID == id).FirstOrDefault();
                return View(lessonDetail);
            }
            catch (Exception e)
            {
                return RedirectToAction("NotFound", "ErrorHandler");
            }
        }

        // GET: Experts/Lesson/Create
        public ActionResult Create(int courseid)
        {
            LessonModel lm = new LessonModel();
            lm.CourseID = courseid;
            LessonController.CourseID = courseid;
            return View(lm);
        }

        // POST: Experts/Lesson/Create
        [HttpPost]
        public ActionResult Create(LessonModel lm, HttpPostedFileBase Video)
        {
            if (ModelState.IsValid)
            {
                if (Video != null)
                {
                    Video.SaveAs(HttpContext.Server.MapPath("~/Assets/Videos/") + Video.FileName);
                    lm.Video = "~/Assets/Videos/" + Video.FileName;
                }

                var lessonToUpdate = new Lesson();
                if (lessonToUpdate != null)
                {
                    // found it
                    try
                    {
                        lessonToUpdate.CourseID = LessonController.CourseID;

                        lessonToUpdate.Name = lm.Name;

                        lessonToUpdate.Intro = lm.Intro;

                        lessonToUpdate.Video = lm.Video;

                        lessonToUpdate.EstimatedTime = lm.EstimatedTime;

                        lessonToUpdate.IsPro = lm.IsPro;

                        lessonToUpdate.Order = dbContext.Lessons.Where(x => x.CourseID == LessonController.CourseID).Count() + 1;

                        dbContext.Lessons.InsertOnSubmit(lessonToUpdate);

                        dbContext.SubmitChanges();

                        return RedirectToAction("Index", new { id = lessonToUpdate.ID });
                    }
                    catch (Exception e)
                    {
                        return View();
                    }
                }
                else
                {
                    return View();
                }

            }
            return View();
        }

        // GET: Experts/Lesson/Edit/5
        public ActionResult Edit(int id)
        {
            Lesson lessonDetail = dbContext.Lessons.Where(x => x.ID == id).FirstOrDefault();
            ViewBag.lessonDetail = lessonDetail;
            return View();
        }

        // POST: Experts/Lesson/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, LessonModel lm, HttpPostedFileBase Video)
        {
            if (ModelState.IsValid)
            {
                if (Video != null)
                {
                    Video.SaveAs(HttpContext.Server.MapPath("~/Assets/Videos/") + Video.FileName);
                    lm.Video = "~/Assets/Videos/" + Video.FileName;
                }
                
                var lessonToUpdate = dbContext.Lessons.SingleOrDefault(x => x.ID == id);
                if (lessonToUpdate != null)
                {
                    // found it
                    try
                    {
                        lessonToUpdate.Name = lm.Name;

                        lessonToUpdate.Intro = lm.Intro;

                        lessonToUpdate.Video = !String.IsNullOrEmpty(lm.Video) ? lm.Video : lessonToUpdate.Video;

                        lessonToUpdate.IsPro = lm.IsPro;

                        dbContext.SubmitChanges();
                        return RedirectToAction("Index", new { id = id });
                    }
                    catch (Exception e)
                    {
                        return View();
                    }
                }
                else
                {
                    return View();
                }

            }
            return View();
        }

        // GET: Experts/Lesson/Delete/5
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
