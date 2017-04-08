using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class ErrorPageController : Controller
    {
        // GET: ErrorPage/Notfound
        public ActionResult Notfound()
        {
            return View();
        }

        // GET: ErrorPage/InternalError
        public ActionResult InternalError()
        {
            return View();
        }
    }
}