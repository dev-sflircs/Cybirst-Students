using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class EpagesController : Controller
    {
        // GET: Epages
        public ActionResult Notfound()
        {
            return View();
        }

        public ActionResult InternalError()
        {
            return View();
        }
    }
}