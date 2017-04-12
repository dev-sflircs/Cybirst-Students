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
            List<Technology> lstTechnology = dataContext.Technologies.ToList<Technology>();

            ViewBag.Technologies = dataAdapter.Convert(lstTechnology);

            return View("All");
        }

        // GET: Technology/Detail
        public ActionResult Detail(int id)
        {
            try
            {
                Technology technology = dataContext.Technologies.Where(x => x.ID == id).FirstOrDefault();

                ViewBag.Technology = dataAdapter.Chain(technology);

                return View("Detail");
            } catch(Exception e)
            {
                return HttpNotFound("I cannot find your Technology");
            }
            
        }
    }
}