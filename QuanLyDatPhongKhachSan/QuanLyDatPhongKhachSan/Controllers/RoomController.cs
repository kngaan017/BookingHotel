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