using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Cybirst.Controllers
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
        public string Password { get; set; }
    }

    [AllowAnonymous]
    public class AuthController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public AuthController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Auth/SignIn
        public ActionResult SignIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignIn(SigninModel signinModel)
        {
            if (ModelState.IsValid)
            {
                Student currentUser = dataContext.Students.Where(x => x.Email == signinModel.Email && x.Password == signinModel.Password).FirstOrDefault();
                if(currentUser != null)
                {
                    FormsAuthentication.SetAuthCookie(currentUser.ID.ToString(), true);
                    System.Web.HttpContext.Current.Session["currentUser"] = dataAdapter.Chain(currentUser);
                    return RedirectToAction("Index", "LandingPage");
                }
                else
                {
                    ViewBag.Error = "Email or Password is not valid!";
                }
            }

            return View();
        }

        // GET: Auth/SignUp
        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignUp(SignupModel signUpModel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    SignupModel a = signUpModel;
                    Cybirst.Student st = new Student();
                    st.FirstName = a.FirstName;
                    st.LastName = a.LastName;
                    st.Email = a.Email;
                    st.UID = a.Email;
                    st.Password = a.Password;
                    st.ExpiredProTime = DateTime.Now;
                    dataContext.Students.InsertOnSubmit(st);
                    dataContext.SubmitChanges();
                    return RedirectToAction("SignIn");
                }catch(Exception e)
                {
                    ViewBag.Error = "Invalid information. Please try again!";
                }
            }
            else
            {
                ViewBag.Error = "Invalid information. Please try again!";
            }
            return View();
        }
    }
}