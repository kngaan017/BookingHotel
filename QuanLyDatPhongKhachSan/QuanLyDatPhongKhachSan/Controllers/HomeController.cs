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
        BookingHotel1Entities3 _db = new BookingHotel1Entities3();

        // GET: Menu
        public ActionResult Index()
        {
            ViewBag.meta = "phong-o";
            var rooms = _db.rooms.ToList();
            return View(rooms);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        
    }
}