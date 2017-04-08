using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cybirst.DAL;
using Cybirst.DAL.Adapters;

namespace Cybirst.Controllers
{
    public class LandingPageController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public LandingPageController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }


        [ChildActionOnly]
        public ActionResult HomeFirst()
        {
            List<Technology> lstTechnology = dataContext.Technologies.Take(10).ToList<Technology>();

            ViewBag.Technologies = lstTechnology;

            return PartialView("HomeFirst");
        }

        
        [ChildActionOnly]
        public ActionResult HundredsFreeVideos()
        {
            return PartialView("HundredsFreeVideos");
        }

        [ChildActionOnly]
        public ActionResult MostPopularCourse()
        {
            return PartialView("MostPopularCourse");
        }

        [ChildActionOnly]
        public ActionResult JoinTheProgrammingElite()
        {
            return PartialView("JoinTheProgrammingElite");
        }

        [ChildActionOnly]
        public ActionResult TaughtByLeaders()
        {
            List<Instructor> lst4Instructor = dataContext.Instructors.Take(4).ToList<Instructor>();

            List<Instructor> lst6Instructor = dataContext.Instructors.Skip(4).Take(6).ToList<Instructor>();
            
            List<Instructor> lstRestInstructor = dataContext.Instructors.Skip(10).ToList<Instructor>();


            ViewBag.First4Instructors = dataAdapter.Convert(lst4Instructor);

            ViewBag.Second6Instructors = dataAdapter.Convert(lst6Instructor);

            ViewBag.LastInstructors = dataAdapter.Convert(lstRestInstructor);

            return PartialView("TaughtByLeaders");
        }

        [ChildActionOnly]
        public ActionResult CoursesInProduction()
        {
           
            return PartialView("CoursesInProduction");
        }

        [ChildActionOnly]
        public ActionResult WhatDoYouWantToLearn()
        {
            //ViewBag.Instructors = _Instructors;

            return PartialView("WhatDoYouWantToLearn");
        }

        [ChildActionOnly]
        public ActionResult BlockQuote()
        {
            //ViewBag.Instructors = _Instructors;

            return PartialView("BlockQuote");
        }

        // GET: LandingPage
        public ActionResult Index()
        {
            return View();
        }
    }
}