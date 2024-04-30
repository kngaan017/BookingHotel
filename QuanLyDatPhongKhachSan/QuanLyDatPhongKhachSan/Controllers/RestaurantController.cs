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
        BookingHotel1Entities5 _db = new BookingHotel1Entities5();

        // GET: Menu
        public ActionResult Restaurant()
        {
            var food = _db.restaurants.ToList();
            return View(food);
        }
    }
}