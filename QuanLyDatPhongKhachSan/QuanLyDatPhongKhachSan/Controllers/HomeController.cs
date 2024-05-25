using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class HomeController : Controller
    {
        BookingHotel1Entities _db = new BookingHotel1Entities();

        // GET: Menu
        public ActionResult Index()
        {
            ViewBag.meta = "phong-o";
            var rooms = _db.rooms.Where(t => t.hide == true).ToList();
            return View(rooms);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult checkAvailability(string roomType, string max)
        {
            return RedirectToAction("Search", "Room", new { roomType = roomType, max = max });
        }
    }
}