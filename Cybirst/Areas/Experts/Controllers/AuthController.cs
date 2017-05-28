using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Cybirst.Areas.Experts.Controllers
{
    public class SigninModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class SignupModel
    {
        [Required]
        [Display(Name = "Firstname")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Lastname")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MinLength(8)]
        public string Password { get; set; }
    }

    public class AuthController : Controller
    {
        private DataClasses1DataContext dbContext = new DataClasses1DataContext();

        // GET: Auth/SignIn
        [AllowAnonymous]
        public ActionResult SignIn()
        {
            return View();
        }

        // POST: Auth/SignIn
        [HttpPost]
        [AllowAnonymous]
        public ActionResult SignIn(SigninModel signinModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Instructor currentUser = dbContext.Instructors.Where(x => x.Email == signinModel.Email && x.Password == signinModel.Password).FirstOrDefault();
                    if (currentUser != null)
                    {
                        FormsAuthentication.SetAuthCookie(currentUser.ID.ToString(), true);
                        System.Web.HttpContext.Current.Session["currentUser"] = currentUser;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.Error = "Email or Password is not valid!";
                        return View();
                    }
                }
                else
                {
                    ViewBag.Error = "Email or Password is not valid!";
                    return View();
                }
                
            }
            catch
            {
                ViewBag.Error = "Email or Password is not valid!";
                return View();
            }
        }

        // GET: Auth/SignUp
        [AllowAnonymous]
        public ActionResult SignUp()
        {
            return View();
        }

        // POST: Auth/SignUp
        [HttpPost]
        [AllowAnonymous]
        public ActionResult SignUp(SignupModel signUpModel)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    SignupModel a = signUpModel;
                    Instructor st = new Instructor();
                    st.FirstName = a.FirstName;
                    st.LastName = a.LastName;
                    st.Email = a.Email;
                    st.UID = a.Email;
                    st.Password = a.Password;
                    dbContext.Instructors.InsertOnSubmit(st);
                    dbContext.SubmitChanges();
                    return RedirectToAction("SignIn");
                }
                else
                {
                    ViewBag.Error = "Invalid information. Please try again!";
                    return View();
                }
            }
            catch
            {
                ViewBag.Error = "Invalid information. Please try again!";
                return View();
            }
        }

        public ActionResult SignOut()
        {
            System.Web.HttpContext.Current.Session["currentUser"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("SignIn");
        }
    }
}
