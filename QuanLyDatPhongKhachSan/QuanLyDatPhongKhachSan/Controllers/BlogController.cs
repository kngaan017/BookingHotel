using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class BlogController : Controller
    {
        public ActionResult Blog()
        {
            return View();
        }
        // GET: Blog
        BookingHotel1Entities3 _db = new BookingHotel1Entities3();

        public ActionResult BlogDetail(long id)
        {
            var v = from t in _db.blogs
                    where t.blogID == id
                    select t;
            return View(v.FirstOrDefault());
        }
    }
}