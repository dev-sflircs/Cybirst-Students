using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Lesson
    {
        public int ID;

        public int CourseID;

        public string Name;

        public string Intro;

        public int EstimatedTime;

        public string Video;

        public int Order;

        public bool IsPro;

        public System.Data.Linq.Binary LastUpdate;

        public Course Course;
    }
}