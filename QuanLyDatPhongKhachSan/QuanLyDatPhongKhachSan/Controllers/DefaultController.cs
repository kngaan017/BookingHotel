using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class DefaultController : Controller
    {


        BookingHotel1Entities3 _db = new BookingHotel1Entities3();
        public ActionResult getRoom()
        {
            ViewBag.meta = "phong-o";
            var v = from t in _db.rooms
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getBlog()
        {
            ViewBag.meta = "blog";
            var v = from t in _db.blogs
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }
    }
}