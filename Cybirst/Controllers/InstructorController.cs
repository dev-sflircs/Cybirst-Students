using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class InstructorController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public InstructorController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Instructor/All
        public ActionResult All()
        {
            List<Instructor> lstInstructor = dataContext.Instructors.ToList<Instructor>();

            int numberOfCardHolders = lstInstructor.Count() / 5;

            List<DAL.Models.Instructor>[] arrInstructor;

            if (lstInstructor.Count() - lstInstructor.Count() / 5 * 5 > 0)
            {
                arrInstructor = new List<DAL.Models.Instructor>[numberOfCardHolders + 1];
            }
            else
            {
                arrInstructor = new List<DAL.Models.Instructor>[numberOfCardHolders];
            }

            for (int i = 0; i < arrInstructor.Length; i++)
            {
                List<Instructor> temp = lstInstructor.Skip(i * 5).Take(5).ToList<Instructor>();

                arrInstructor[i] = dataAdapter.Convert(temp);
            }          

            ViewBag.Instructors = arrInstructor;

            return View("All");
        }

        // GET: Instructor/Detail
        public ActionResult Detail(string uid)
        {
            try
            {
                Instructor Instructor = dataContext.Instructors.Where(x => x.UID == uid).FirstOrDefault();

                ViewBag.Instructor = dataAdapter.Chain(Instructor);

                return View("Detail");
            }catch(Exception e)
            {
                return HttpNotFound("I cannot found your Instructor! :(");
            }         
        }
    }
}