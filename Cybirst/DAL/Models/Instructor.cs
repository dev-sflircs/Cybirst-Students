using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Instructor
    {
        public int ID;

        public string UID;

        public string FirstName;

        public string LastName;

        public string Intro;

        public string ShortIntro;

        public string GooglePlus;

        public string Twitter;

        public string Facebook;

        public string GitHub;

        public string Blog;

        public string Email;

        public string Password;

        public string Phone;

        public string Address;

        public string SmAvatar;

        public string MdAvatar;

        public string LgAvatar;

        public int TotalCourses;

        public List<Course> Courses;

        public List<string> Teachings = new List<string>();
    }
}