using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class TechnologyController : Controller
    {

        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public TechnologyController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Technology/All
        public ActionResult All()
        {
            return View("All");
        }

        // GET: Technology/Detail
        public ActionResult Detail()
        {
            return View("Detail");
        }
    }
}