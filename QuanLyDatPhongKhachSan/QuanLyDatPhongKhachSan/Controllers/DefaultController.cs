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


        BookingHotel1Entities1 _db = new BookingHotel1Entities1();

        public ActionResult getRandomRoom()
        {
            var v = (from t in _db.rooms
                     orderby Guid.NewGuid()
                     select t).Take(6);
            return PartialView(v.ToList());
        }

        public ActionResult getRoom()
        {
            var v = from t in _db.rooms
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