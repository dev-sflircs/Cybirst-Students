using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Cybirst.Areas.Experts.Controllers
{
    public class CourseModel
    {
        public int ID { get; set; }

        public string TechnologyID { get; set; }

        public int InstructorID { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Intro { get; set; }

        public string SmImage { get; set; }

        public string MdImage { get; set; }

        public string LgImage { get; set; }

        [Required]
        public bool IsPro { get; set; }
    }

    public class CourseController : Controller
    {
        private DataClasses1DataContext dbContext = new DataClasses1DataContext();

        // GET: Course
        public ActionResult Index(int id)
        {
            try
            {
                Course courseDetail = dbContext.Courses.Where(x => x.ID == id).FirstOrDefault();
                return View(courseDetail);
            }
            catch (Exception e)
            {
                return RedirectToAction("NotFound", "ErrorHandler");   
            }
        }

        public ActionResult Update(int id)
        {
            try
            {
                Course courseDetail = dbContext.Courses.Where(x => x.ID == id).FirstOrDefault();
                return View(courseDetail);
            }
            catch (Exception e)
            {
                return RedirectToAction("NotFound", "ErrorHandler");
            }
        }

        // GET: Course/Edit/5
        public ActionResult Edit(int id)
        {
            Course courseDetail = dbContext.Courses.Where(x => x.ID == id).FirstOrDefault();
            ViewBag.CourseDetail = courseDetail;

            List<Technology> lst = dbContext.Technologies.ToList();

            List<SelectListItem> techs = new List<SelectListItem>();

            foreach(var tech in lst)
            {
                if (courseDetail.TechnologyID == tech.ID)
                {
                    techs.Add(new SelectListItem { Text = tech.Name, Value = tech.ID.ToString(), Selected = true });
                }
                else
                {
                    techs.Add(new SelectListItem { Text = tech.Name, Value = tech.ID.ToString()});
                }
            }

            ViewBag.Technologies = techs;
            return View();
        }

        // GET: Course/Create
        public ActionResult Create()
        {
            List<Technology> lst = dbContext.Technologies.ToList();

            List<SelectListItem> techs = new List<SelectListItem>();

            int i = 0;

            foreach (var tech in lst)
            {
                if (i == 0)
                {
                    techs.Add(new SelectListItem { Text = tech.Name, Value = tech.ID.ToString(), Selected = true });
                }
                else
                {
                    techs.Add(new SelectListItem { Text = tech.Name, Value = tech.ID.ToString() });
                }

                i++;
            }

            ViewBag.Technologies = techs;
            return View();
        }

        // POST: Course/Create
        [HttpPost]
        public ActionResult Create(CourseModel cm, HttpPostedFileBase SmImage, HttpPostedFileBase MdImage, HttpPostedFileBase LgImage)
        {
            if (ModelState.IsValid)
            {
                if (SmImage != null)
                {
                    SmImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + SmImage.FileName);
                    cm.SmImage = "~/Assets/Images/" + SmImage.FileName;
                }
                if (MdImage != null)
                {
                    MdImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + MdImage.FileName);
                    cm.MdImage = "~/Assets/Images/" + MdImage.FileName;
                }
                if (LgImage != null)
                {
                    LgImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + LgImage.FileName);
                    cm.LgImage = "~/Assets/Images/" + LgImage.FileName;
                }

                try
                {
                    Course courseToCreate = new Course();

                    courseToCreate.TechnologyID = Int32.Parse(cm.TechnologyID);

                    Instructor ins = (Instructor)(System.Web.HttpContext.Current.Session["currentUser"]);

                    courseToCreate.InstructorID = ins.ID;

                    courseToCreate.Name = cm.Name;

                    courseToCreate.Intro = cm.Intro;

                    courseToCreate.SmImage = cm.SmImage;

                    courseToCreate.MdImage = cm.MdImage;

                    courseToCreate.LgImage = cm.LgImage;

                    courseToCreate.IsPro = cm.IsPro;

                    dbContext.Courses.InsertOnSubmit(courseToCreate);

                    dbContext.SubmitChanges();

                    return RedirectToAction("Index", "Home");
                }
                catch (Exception e)
                {
                    return View();
                }
            }
            return View();
        }

        // POST: Course/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, CourseModel cm, HttpPostedFileBase SmImage, HttpPostedFileBase MdImage, HttpPostedFileBase LgImage)
        {
            if (ModelState.IsValid)
            {
                if (SmImage != null)
                {
                    SmImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + SmImage.FileName);
                    cm.SmImage = "~/Assets/Images/" + SmImage.FileName;
                }
                if (MdImage != null)
                {
                    MdImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + MdImage.FileName);
                    cm.MdImage = "~/Assets/Images/" + MdImage.FileName;
                }
                if(LgImage != null)
                {
                    LgImage.SaveAs(HttpContext.Server.MapPath("~/Assets/Images/") + LgImage.FileName);
                    cm.LgImage = "~/Assets/Images/" + LgImage.FileName;
                }

                var courseToUpdate = dbContext.Courses.SingleOrDefault(x => x.ID == id);
                if (courseToUpdate != null)
                {
                    // found it
                    try
                    {
                        courseToUpdate.TechnologyID = Int32.Parse(cm.TechnologyID);

                        Instructor ins = (Instructor)(System.Web.HttpContext.Current.Session["currentUser"]);

                        courseToUpdate.InstructorID = ins.ID;

                        courseToUpdate.Name = cm.Name;

                        courseToUpdate.Intro = cm.Intro;

                        courseToUpdate.SmImage = !String.IsNullOrEmpty(cm.SmImage) ? cm.SmImage : courseToUpdate.SmImage;

                        courseToUpdate.MdImage = !String.IsNullOrEmpty(cm.MdImage) ? cm.MdImage : courseToUpdate.MdImage;

                        courseToUpdate.LgImage = !String.IsNullOrEmpty(cm.LgImage) ? cm.LgImage : courseToUpdate.LgImage;

                        courseToUpdate.IsPro = cm.IsPro;

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

        // GET: Course/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Course/Delete/5
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
