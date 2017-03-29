using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cybirst.Models;

namespace Cybirst.Controllers
{
    public class LandingPageController : Controller
    {
        private DataClasses1DataContext dataContext;
        private string nameIntructor;
        private string nameTech;

        public LandingPageController()
        {
            dataContext = new DataClasses1DataContext();
        }

        [ChildActionOnly]
        public ActionResult HundredsFreeVideos()
        {
            return PartialView("HundredsFreeVideos");
        }

        [ChildActionOnly]
        public ActionResult HomeFirst()
        {
            List<Technology> list_Technologies = new List<Technology>();
            var query = (from c in dataContext.Technologies select c).ToList();
            foreach (Technology tech in query)
            {
                list_Technologies.Add(
                   new Technology
                   {
                       Name = tech.Name,
                       Image = tech.Image
                   }
                );
            }
            ViewBag.Technologies = list_Technologies;

            return PartialView("HomeFirst");
        }

        [ChildActionOnly]
        public ActionResult TaughtByLeaders()
        {
            List<Instructor> list_Instructors = new List<Instructor>();
            Dictionary<string, List<string>> dict_TechIns = new Dictionary<string, List<string>>();
            var intructorQuery = (from i in dataContext.Instructors select i).ToList();
            foreach (var temp in intructorQuery)
            {
                list_Instructors.Add(new Instructor()
                {
                    ID = temp.ID,
                    UID = temp.UID,
                    FirstName = temp.FirstName,
                    LastName = temp.LastName,
                    Intro = temp.Intro,
                    Google = temp.Google,
                    Twitter = temp.Twitter,
                    Blog = temp.Blog,
                    Email = temp.Email,
                    Password = temp.Password,
                    Phone = temp.Phone,
                    Address = temp.Address,
                    Avatar = temp.Avatar,
                    LargeAvatar = temp.LargeAvatar,
                    MediumAvatar = temp.MediumAvatar,
                    LastUpdate = temp.LastUpdate
                });
                var z = dataContext.Technologies.Where(t =>
                                               dataContext.Courses.Where(u =>
                                               dataContext.Lessons.Where(crtu => crtu.InstructorID == temp.ID)
                                               .Select(crtu => crtu.CourseID)
                                               .Contains(u.ID))
                                               .Select(te => te.ID)
                                               .Contains(t.ID));
                List<string> listTech = new List<string>();
                foreach (var tech in z)
                {
                    listTech.Add(tech.Name);
                }
                dict_TechIns.Add(temp.ID.ToString(), listTech);
            }
            ViewBag.Instructors = list_Instructors;
            ViewBag.TechsTaughtByInstructors = dict_TechIns;
            
            return PartialView("TaughtByLeaders");
        }

        [ChildActionOnly]
        public ActionResult CoursesInProduction()
        {
            var qListCourse = (from c in dataContext.Courses select c).ToList();
            List<CoursesInProduction> listCourseInProduct = new List<CoursesInProduction>();
            
            List<Course> listCourse = new List<Course>();
            foreach (var lc in qListCourse)
            {
                listCourse.Add(new Course()
                {
                    ID = lc.ID,
                    TeachnologyID = lc.TeachnologyID,
                    Name = lc.Name,
                    Image = lc.Image,
                    Intro = lc.Intro,
                });
            }

            foreach (Course course in listCourse)
            {

                var query = (dataContext.Instructors.Where(ins =>
                                   dataContext.Lessons.Where(les =>
                                   les.CourseID == course.ID)
                                  .Select(i => i.InstructorID)
                                  .Contains(ins.ID)
                     )).ToList();
                foreach (var instructor in query)
                {
                    nameIntructor = instructor.FirstName + instructor.LastName;
                }

                var query2 = (dataContext.Technologies.Where(c => c.ID == course.TeachnologyID)).ToList();
                foreach (var tech in query2)
                {
                    nameTech = tech.Name;
                }
                listCourseInProduct.Add(
                    new CoursesInProduction()
                    {
                        Image = course.Image,
                        Name = course.Name,
                        Technology = nameTech,
                        Instructor = nameIntructor,
                    }
                );
            }
            ViewBag.Courses = listCourseInProduct;

            return PartialView("CoursesInProduction");
        }

        [ChildActionOnly]
        public ActionResult WhatDoYouWantToLearn()
        {
            //ViewBag.Instructors = _Instructors;

            return PartialView("WhatDoYouWantToLearn");
        }

        [ChildActionOnly]
        public ActionResult BlockQuote()
        {
            //ViewBag.Instructors = _Instructors;

            return PartialView("BlockQuote");
        }

        // GET: LandingPage
        public ActionResult Index()
        {
            return View();
        }
    }
}