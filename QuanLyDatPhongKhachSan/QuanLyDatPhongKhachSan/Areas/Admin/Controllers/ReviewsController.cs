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
    public class ReviewsController : Controller
    {
        private BookingHotel1Entities db = new BookingHotel1Entities();

        // GET: Admin/Reviews
        public ActionResult Index()
        {
            var reviews = db.reviews.Include(r => r.room).Include(r => r.user);
            return View(reviews.ToList());
        }

        // GET: Admin/Reviews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            review review = db.reviews.Find(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            return View(review);
        }

        // GET: Admin/Reviews/Create
        public ActionResult Create()
        {
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type");
            ViewBag.userID = new SelectList(db.users, "userID", "username");
            return View();
        }

        // POST: Admin/Reviews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reviewID,userID,roomID,rating,comment,reviewDate,meta,hide,order,datebegin")] review review)
        {
            if (ModelState.IsValid)
            {
                db.reviews.Add(review);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", review.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", review.userID);
            return View(review);
        }

        // GET: Admin/Reviews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            review review = db.reviews.Find(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", review.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", review.userID);
            return View(review);
        }

        // POST: Admin/Reviews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reviewID,userID,roomID,rating,comment,reviewDate,meta,hide,order,datebegin")] review review)
        {
            if (ModelState.IsValid)
            {
                db.Entry(review).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.roomID = new SelectList(db.rooms, "roomID", "type", review.roomID);
            ViewBag.userID = new SelectList(db.users, "userID", "username", review.userID);
            return View(review);
        }

        // GET: Admin/Reviews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            review review = db.reviews.Find(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            return View(review);
        }

        // POST: Admin/Reviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            review review = db.reviews.Find(id);
            db.reviews.Remove(review);
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
