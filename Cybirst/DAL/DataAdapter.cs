using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cybirst.DAL;

namespace Cybirst.DAL.Adapters
{
    public class DataAdapter
    {
       public List<DAL.Models.Instructor> Convert(List<Cybirst.Instructor> inputs)
        {
            List<DAL.Models.Instructor> temp = new List<Models.Instructor>();

            DAL.Models.Instructor inst;

            foreach (var item in inputs)
            {
                inst = new Models.Instructor();

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

                inst.TotalLessons = item.TotalLessons;

                // inst.Teachings
                List<string> teachs = new List<string>();
                List<Course> lstCourses = item.Courses.ToList<Course>();
                
                foreach (var course in lstCourses)
                {
                    Technology tech = course.Technology;
                    teachs.Add(tech.Name.Trim());
                }

                inst.Teachings = teachs.Distinct().ToList();

                temp.Add(inst);
            }

            return temp;
        }             
    }
}