using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class HomeController : Controller
    {

        BookingHotel1Entities1 _db = new BookingHotel1Entities1();

        public ActionResult getRandomRoom()
        {
            var v = (from t in _db.rooms
                     orderby Guid.NewGuid()
                     select t).Take(6);
            return PartialView(v.ToList());
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        
    }
}