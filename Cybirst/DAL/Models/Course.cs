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

        private string MdImage;

        private string LgImage;

        private bool IsPro;

        private int TotalLessons;

        private int EstimatedTime;

        private System.Data.Linq.Binary LastUpdate;

        private List<Enrollment> Enrollments;

        private List<Lesson> Lessons;

        private Instructor Instructor;

        private Technology Technology;
    }
}