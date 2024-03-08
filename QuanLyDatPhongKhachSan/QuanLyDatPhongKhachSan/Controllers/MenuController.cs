using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyDatPhongKhachSan.Models;
namespace QuanLyDatPhongKhachSan.Controllers
{
    public class MenuController : Controller
    {

        BookingHotel1Entities1 _db = new BookingHotel1Entities1();

        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getMenu()
        {
            var v = from t in _db.menus
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}