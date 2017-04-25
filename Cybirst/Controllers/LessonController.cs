using Cybirst.DAL.Adapters;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace Cybirst.Controllers
{
    public class VideoDataResult : ActionResult
    {
        private string fileName;
        public VideoDataResult(string fileName)
        {
            this.fileName = fileName;
        } 

        /// <summary>
        /// The below method will respond with the Video file
        /// </summary>
        /// <param name="context"></param>
        public override void ExecuteResult(ControllerContext context)
        {

            var strVideoFilePath = HostingEnvironment.MapPath(this.fileName);

            context.HttpContext.Response.AddHeader("Content-Disposition", "attachment; filename=Test2.mp4");

            var objFile = new FileInfo(strVideoFilePath);

            var stream = objFile.OpenRead();
            var objBytes = new byte[stream.Length];
            stream.Read(objBytes, 0, (int)objFile.Length);
            context.HttpContext.Response.BinaryWrite(objBytes);
        }
    }
    public class VideoController : Controller
    {
        // GET: Lession
        public ActionResult Index(string videoUrl)
        {
            return new VideoDataResult(videoUrl);
        }
    }

    public class LessonController : Controller
    {
        private DataClasses1DataContext dataContext;
        private DataAdapter dataAdapter;

        public LessonController()
        {
            dataContext = new DataClasses1DataContext();
            dataAdapter = new DataAdapter();
        }

        // GET: Lession
        public ActionResult Index(int uid)
        {
            try
            {
                Lesson currentLesson = dataContext.Lessons.Where(x => x.ID == uid).FirstOrDefault();

                ViewBag.Lesson = dataAdapter.Chain(currentLesson);

                if (currentLesson.Order > 1)
                {
                    List<Lesson> lstPreviousLessions = dataContext.Lessons.Take(currentLesson.Order - 1).ToList<Lesson>();

                    ViewBag.PreviousLessons = dataAdapter.Convert(lstPreviousLessions);
                }
                else
                {
                    List<Lesson> lstPreviousLessions = new List<Lesson>();

                    ViewBag.PreviousLessons = dataAdapter.Convert(lstPreviousLessions);
                }                 

                List<Lesson> lstNextLessions = dataContext.Lessons.Skip(currentLesson.Order).ToList<Lesson>();

                ViewBag.NextLessons = dataAdapter.Convert(lstNextLessions);

                return View();
            }
            catch (Exception e)
            {
                return HttpNotFound("I cannot found your Lesson! :(");
            }
            
        }
    }
}