using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class ProfileController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;
        public ProfileController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Profile
        public ActionResult Index(string ID)
        {
            Student st = dataContext.Students.Where(x => x.ID == Int64.Parse(ID)).FirstOrDefault();
            ViewBag.Student = dataAdapter.Chain(st);
            return View();
        }
    }
}