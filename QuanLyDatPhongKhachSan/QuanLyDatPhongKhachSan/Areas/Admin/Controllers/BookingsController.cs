using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyDatPhongKhachSan.Models;

namespace QuanLyDatPhongKhachSan.Areas.Admin.Controllers
{
    public class BookingsController : Controller
    {
        private BookingHotel1Entities2 db = new BookingHotel1Entities2();

        // GET: Admin/Bookings
        public ActionResult Index()
        {
            var bookings = db.bookings.Include(b => b.room).Include(b => b.user);
            return View(bookings.ToList());
        }
        [HttpPost]
        public ActionResult UpdateStatus(int itemId)
        {
            // Lấy item từ cơ sở dữ liệu dựa trên itemId
            var item = db.bookings.Find(itemId);

            if (item != null && item.status == "Pending")
            {
                item.status = "Accepted";
                db.SaveChanges();
                return Json(new { success = true });
            }

            // Trả về thông báo lỗi nếu không cập nhật được
            return Json(new { success = false });
        }


        // GET: Admin/Bookings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            booking booking = db.bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // GET: Admin/Bookings/Create
        public ActionResult Create()
        {
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type");
            ViewBag.userID = new SelectList(db.users, "userID", "username");
            return View();
        }

        // POST: Admin/Bookings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "bookingID,userID,roomID,startDate,endDate,numberOfGuest,total,status,name,phone,email,requests,meta,hide,order,datebegin")] booking booking)
        {
            if (ModelState.IsValid)
            {
                db.bookings.Add(booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", booking.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", booking.userID);
            return View(booking);
        }

        // GET: Admin/Bookings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            booking booking = db.bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", booking.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", booking.userID);
            return View(booking);
        }

        // POST: Admin/Bookings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "bookingID,userID,roomID,startDate,endDate,numberOfGuest,total,status,name,phone,email,requests,meta,hide,order,datebegin")] booking booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", booking.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", booking.userID);
            return View(booking);
        }

        // GET: Admin/Bookings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            booking booking = db.bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // POST: Admin/Bookings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            booking booking = db.bookings.Find(id);
            db.bookings.Remove(booking);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
