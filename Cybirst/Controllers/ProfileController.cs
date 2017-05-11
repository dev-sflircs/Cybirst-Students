using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class ProfileController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public ProfileController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Profile
        public ActionResult Index(string uid)
        {
            Student student = dataContext.Students.Where(x => x.ID == ID).FirstOrDefault();
            List<Enrollment> enrollments = student.Enrollments.ToList();
            List<Course> courses = new List<Course>();
            int minutes_watched = 0;
            int lessons_watched = 0;
            foreach (Enrollment enrollment in enrollments) {
                Course course = enrollment.Course;
                courses.Add(course);
                lessons_watched = lessons_watched + enrollment.OrderState; // compute total lessons student watched in each enrollment
                for (int i = 0; i < enrollment.OrderState; i++) {
                    minutes_watched = minutes_watched + enrollment.Course.Lessons[i].EstimatedTime; // compute total minutes student watched in each enrollment
                }
            }
            minutes_watched = minutes_watched / 60;
            ViewBag.minutes_watched = minutes_watched;
            ViewBag.courses = courses;
            ViewBag.lessons_watched = lessons_watched;
            return View(student);
        }
    }
}