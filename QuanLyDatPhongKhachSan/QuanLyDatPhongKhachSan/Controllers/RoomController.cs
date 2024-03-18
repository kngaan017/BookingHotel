using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class RoomController : Controller
    {

        BookingHotel1Entities1 _db = new BookingHotel1Entities1();

        // GET: Room
        public ActionResult RoomDetail(long id)
        {
            var v = from t in _db.rooms
                    where t.roomID == id
                    select t;
            return View(v.FirstOrDefault());
        }

        public ActionResult Booking(long id)
        {
            var v = from t in _db.rooms
                    where t.roomID == id
                    select t;
            return View(v.FirstOrDefault());
        }

        public ActionResult Rooms()
        {
            ViewBag.meta = "phong-o";
            var rooms = _db.rooms.ToList();
            return View(rooms);
        }

    }
}