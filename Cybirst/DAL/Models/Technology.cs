using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Technology
    {
        public int ID;

        public string Name;

        public string Intro;

        public string SmImage;

        public string MdImage;

        public string LgImage;

        public int TotalCourses;

        public int TotalLessons;

        public System.Data.Linq.Binary LastUpdate;

        public List<Course> Courses;
    }
}