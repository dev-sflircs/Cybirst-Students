using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cybirst.DAL;

namespace Cybirst.DAL.Adapters
{
    public class DataAdapter
    {

        public DAL.Models.Lesson Chain(Cybirst.Lesson item)
        {
            DAL.Models.Lesson lesson = new Models.Lesson();

            lesson.ID = item.ID;

            lesson.Name = item.Name;

            lesson.Intro = item.Intro;

            lesson.Video = item.Video;

            lesson.EstimatedTime = item.EstimatedTime;

            lesson.Order = item.Order;

            lesson.IsPro = item.IsPro;

            lesson.Image = item.Course.Technology.MdImage;

            lesson.Course = new Models.Course();

            lesson.Course.ID = item.Course.ID;

            lesson.Course.Name = item.Course.Name;

            lesson.Course.Technology = new Models.Technology();

            lesson.Course.Technology.ID = item.Course.Technology.ID;

            lesson.Course.Technology.Name = item.Course.Technology.Name;

            lesson.Course.Instructor = new Models.Instructor();

            lesson.Course.Instructor.ID = item.Course.Instructor.ID;

            lesson.Course.Instructor.FirstName = item.Course.Instructor.FirstName;

            lesson.Course.Instructor.LastName = item.Course.Instructor.LastName;

            return lesson;
        }

        /// <summary>
        /// Chain Cybirst.Instructor to DAL.Models.Instructor
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public DAL.Models.Instructor Chain(Cybirst.Instructor item)
        {
            DAL.Models.Instructor inst = new Models.Instructor();

            inst.ID = item.ID;

            inst.UID = item.UID;

            inst.FirstName = item.FirstName;

            inst.LastName = item.LastName;

            inst.Intro = item.Intro;

            inst.ShortIntro = item.ShortIntro;

            inst.GooglePlus = item.GooglePlus;

            inst.Twitter = item.Twitter;

            inst.Facebook = item.Facebook;

            inst.GitHub = item.GitHub;

            inst.Blog = item.Blog;

            inst.Email = item.Email;

            inst.Password = item.Password;

            inst.Phone = item.Phone;

            inst.Address = item.Address;

            inst.SmAvatar = item.SmAvatar;

            inst.MdAvatar = item.MdAvatar;

            inst.LgAvatar = item.LgAvatar;

            inst.TotalCourses = item.TotalCourses;

            // inst.Teachings
            List<string> teachs = new List<string>();
            List<Course> lstCourses = item.Courses.ToList<Course>();

            inst.Courses = this.Convert(item.Courses.ToList());
            
            foreach (var course in lstCourses)
            {
                Technology tech = course.Technology;
                teachs.Add(tech.Name.Trim());
            }

            inst.Teachings = teachs.Distinct().ToList();

            return inst;
        }

        /// <summary>
        /// Chain Cybirst.Technology to DAL.Models.Technology
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public DAL.Models.Technology Chain(Cybirst.Technology item)
        {
            DAL.Models.Technology tech = new Models.Technology();

            tech.ID = item.ID;

            tech.Name = item.Name;

            tech.Intro = item.Intro;

            tech.SmImage = item.SmImage;

            tech.MdImage = item.MdImage;

            tech.LgImage = item.LgImage;

            tech.TotalCourses = item.TotalCourses;

            tech.TotalLessons = item.TotalLessons;

            tech.Courses = this.Convert(item.Courses.ToList());

            return tech;
        }

        /// <summary>
        /// Chain Cybirst.Course to DAL.Models.Course
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public DAL.Models.Course Chain(Cybirst.Course item)
        {
            DAL.Models.Course course = new Models.Course();

            course.ID = item.ID;

            course.TechnologyID = item.TechnologyID;

            course.InstructorID = item.InstructorID;

            course.Name = item.Name;

            course.Intro = item.Intro;

            course.SmImage = item.SmImage;

            course.MdImage = item.MdImage;

            course.LgImage = item.LgImage;

            course.IsPro = item.IsPro;

            course.TotalLessons = item.TotalLessons;

            course.EstimatedTime = item.EstimatedTime;

            course.Instructor = new Models.Instructor();

            course.Instructor.ID = item.Instructor.ID;

            course.Instructor.FirstName = item.Instructor.FirstName;

            course.Instructor.LastName = item.Instructor.LastName;

            course.Instructor.SmAvatar = item.Instructor.SmAvatar;

            course.Instructor.MdAvatar = item.Instructor.MdAvatar;

            course.Instructor.LgAvatar = item.Instructor.LgAvatar;

            course.Instructor.Intro = item.Instructor.Intro;

            course.Instructor.ShortIntro = item.Instructor.ShortIntro;

            course.Instructor.Twitter = item.Instructor.Twitter;

            course.Instructor.Facebook = item.Instructor.Facebook;

            course.Instructor.GitHub = item.Instructor.GitHub;

            course.Technology = new Models.Technology();

            course.Technology.ID = item.Technology.ID;

            course.Technology.Name = item.Technology.Name;

            course.Technology.MdImage = item.Technology.MdImage;

            course.Lessons = this.Convert(item.Lessons.ToList());

            return course;
        }






        public List<DAL.Models.Course> Convert(List<Cybirst.Course> inputs)
        {
            List<DAL.Models.Course> temp = new List<Models.Course>();

            foreach (var item in inputs)
            {
                temp.Add(this.Chain(item));
            }
            return temp;
        }

        public List<DAL.Models.Technology> Convert(List<Cybirst.Technology> inputs)
        {
            List<DAL.Models.Technology> temp = new List<Models.Technology>();

            foreach (var item in inputs)
            {
                temp.Add(this.Chain(item));
            }

            return temp;
        }

        public List<DAL.Models.Instructor> Convert(List<Cybirst.Instructor> inputs)
        {
            List<DAL.Models.Instructor> temp = new List<Models.Instructor>();

            foreach (var item in inputs)
            {
                temp.Add(this.Chain(item));
            }

            return temp;
        }

        public List<DAL.Models.Lesson> Convert(List<Cybirst.Lesson> inputs)
        {
            List<DAL.Models.Lesson> temp = new List<Models.Lesson>();

            foreach (var item in inputs)
            {
                temp.Add(this.Chain(item));
            }

            return temp;
        }
    }
}