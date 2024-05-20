using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Table()
        {
            return View();
        }
    }
}