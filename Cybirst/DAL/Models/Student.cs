using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Student
    {
        public int ID;

        public string UID;

        public string FirstName;

        public string LastName;

        public string Intro;

        public string GooglePlus;

        public string Twitter;

        public string Facebook;

        public string Blog;

        public string Email;

        public string Password;

        public string Phone;

        public string Address;

        public string SmAvatar;

        public string MdAvatar;

        public string LgAvatar;

        public System.DateTime ExpiredProTime;

        public System.Data.Linq.Binary LastUpdate;

        public List<Enrollment> Enrollments;
    }
}