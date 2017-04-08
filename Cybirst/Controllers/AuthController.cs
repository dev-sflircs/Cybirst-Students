using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class AuthController : Controller
    {
        // GET: Auth/SignIn
        public ActionResult SignIn()
        {
            return View();
        }

        // GET: Auth/SignUp
        public ActionResult SignUp()
        {
            return View();
        }
    }
}