using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace Cybirst.DAL.Models
{
    public class Enrollment
    {
        public int ID;

        public int StudentID;

        public int CourseID;

        public bool IsComplete;

        public System.DateTime TimeStart;

        public int OrderState;

        public System.Data.Linq.Binary LastActive;

        public Course Course;

        private Student Student;
    }
}