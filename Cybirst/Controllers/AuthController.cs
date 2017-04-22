using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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


    public class AuthController : Controller
    {
        private DataClasses1DataContext dataContext;

        public AuthController()
        {
            dataContext = new DataClasses1DataContext();
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
                SigninModel a = signinModel;
                return RedirectToAction("Index", "LandingPage");
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
                SignupModel a = signUpModel;
                Cybirst.Student st = new Student();
                st.FirstName = a.FirstName;
                st.LastName = a.LastName;
                st.Email = a.Email;
                st.Password = a.Password;
                st.ExpiredProTime = DateTime.Now;
                dataContext.Students.InsertOnSubmit(st);
                dataContext.SubmitChanges();
                return RedirectToAction("SignIn");
            }
            else
            {
                ViewBag.Error = "Thông tin không hợp lệ!";
            }
            return View();
        }
    }
}