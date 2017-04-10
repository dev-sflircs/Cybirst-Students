using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Course
    {
        public int ID;

        public int TechnologyID;

        public int InstructorID;

        public string Name;

        public string Intro;

        public string SmImage;

        public string MdImage;

        public string LgImage;

        public bool IsPro;

        public int TotalLessons;

        public int EstimatedTime;

        public System.Data.Linq.Binary LastUpdate;

        public List<Enrollment> Enrollments;

        public List<Lesson> Lessons;

        public Instructor Instructor;

        public Technology Technology;
    }
}