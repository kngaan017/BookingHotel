using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class RestaurantController : Controller
    {
        BookingHotel1Entities1 _db = new BookingHotel1Entities1();

        // GET: Menu
        public ActionResult Restaurant()
        {
            var food = _db.restaurants.ToList();
            return View(food);
        }
    }
}