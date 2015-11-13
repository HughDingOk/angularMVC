using angularMVC.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace angularMVC.Controllers
{
    public class HomeController : Controller
    {
        private ModelngMVCContainer db = new ModelngMVCContainer();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        
        public ActionResult fileUpload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult fileUpload(HttpPostedFileBase file)
        {
            if (file!=null&&file.ContentLength>0)
            {
                string fileName = Path.GetFileName(file.FileName);
                int length = file.ContentLength;
                byte[] buffer = new byte[length];
                //讀取stream寫入buffer
                file.InputStream.Read(buffer, 0, length);

                DbFiles dbfile = new DbFiles()
                {
                    Name = fileName,
                    MimeType = file.ContentType,
                    Size = length,
                    Content = buffer
                };

                try
                {
                    db.DbFiles.Add(dbfile);
                    db.SaveChanges();
                    string message = "Name:" + fileName + ",<br/>" +
                        "Content Type:" + file.ContentType + ",<br/>" +
                        "Size:" + length + ",<br/>" +
                        "上傳成功。";
                    TempData["Message"] = message;
                }
                catch (Exception ex)
                {
                    TempData["Message"] = "上傳失敗:" + ex.Message;
                }
            }
            else
            {
                TempData["Message"] = "未選擇或空白檔案。";
            }
            return View();
        }

        public ActionResult getImage(int id)
        {
            var file = db.DbFiles
                .Where(f => f.Id == id)
                .SingleOrDefault();

            if (file!=null)
            {
                byte[] buffer = file.Content;
                return File(buffer, "image/jpeg");
            }
            return Content("找不到檔案！");
        }
    }
}