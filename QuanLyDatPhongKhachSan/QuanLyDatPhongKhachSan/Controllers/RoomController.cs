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

        public ActionResult getRoom()
        {
            var v = from t in _db.rooms
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        } 
        // GET: Room
        public ActionResult RoomDetail()
        {
            return View();
        }

        public ActionResult Rooms()
        {

            return View();
        }
    }
}