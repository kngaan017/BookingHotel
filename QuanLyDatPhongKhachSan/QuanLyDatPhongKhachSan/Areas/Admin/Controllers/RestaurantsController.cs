using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyDatPhongKhachSan.Help;
using QuanLyDatPhongKhachSan.Models;

namespace QuanLyDatPhongKhachSan.Areas.Admin.Controllers
{
    public class RestaurantsController : Controller
    {
        private BookingHotel1Entities3 db = new BookingHotel1Entities3();

        // GET: Admin/Restaurants
        public ActionResult Index()
        {
            return View(db.restaurants.ToList());
        }

        // GET: Admin/Restaurants/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            restaurant restaurant = db.restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // GET: Admin/Restaurants/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Restaurants/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "id,name,img,price,description,meta,hide,order,datebegin")] restaurant restaurant)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.restaurants.Add(restaurant);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(restaurant);
        //}
        [HttpPost]
[ValidateAntiForgeryToken]
public ActionResult Create([Bind(Include = "id,name,img,price,description,meta,hide,order,datebegin")] restaurant restaurant, HttpPostedFileBase img)
{
    try
    {
        var path = "";
        var filename = "";
        if (ModelState.IsValid)
        {
            if (img != null)
            {
                filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                path = Path.Combine(Server.MapPath("~/Content/upload/img/restaurant"), filename);
                img.SaveAs(path);
                restaurant.img = filename;
            }
            else
            {
                restaurant.img = "default-restaurant-image.png";
            }
            restaurant.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            restaurant.meta = Functions.ConvertToUnSign(restaurant.meta); //convert Tiếng Việt không dấu
            db.restaurants.Add(restaurant);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
    catch (Exception ex)
    {
        throw ex;
    }
    return View(restaurant);
}

       

        // GET: Admin/Restaurants/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            restaurant restaurant = db.restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // POST: Admin/Restaurants/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,img,price,description,meta,hide,order,datebegin")] restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(restaurant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(restaurant);
        }

        // GET: Admin/Restaurants/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            restaurant restaurant = db.restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // POST: Admin/Restaurants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            restaurant restaurant = db.restaurants.Find(id);
            db.restaurants.Remove(restaurant);
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
