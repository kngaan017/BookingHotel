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


        BookingHotel1Entities _db = new BookingHotel1Entities();
        public ActionResult getRoom()
        {
            ViewBag.meta = "phong-o";
            var v = from t in _db.rooms
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getBlog()
        {
            ViewBag.meta = "blog";
            var v = from t in _db.blogs
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getReview(int roomID)
        {
            ViewBag.meta = "review";
            var v = from t in _db.reviews
                    where t.roomID == roomID && t.hide == true
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