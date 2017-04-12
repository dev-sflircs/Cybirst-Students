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

    public class LessionController : Controller
    {
        // GET: Lession
        public ActionResult Index(int id)
        {
            ViewBag.videoUrl = "~/Videos/747a8fc6b9e502bf74a109693067f511eed1dc8b.mp4";
            return View();
        }
    }
}