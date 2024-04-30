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
        private BookingHotel1Entities5 db = new BookingHotel1Entities5();

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
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,price,img,description,meta,hdie,order,datebegin")] restaurant restaurant, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/restaurant"), filename);
                        img.SaveAs(path);
                        restaurant.img = filename; //Lưu ý
                    }
                    else
                    {
                        restaurant.img = "menu-1.jpg";
                    }
                    restaurant.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    restaurant.meta = Functions.ConvertToUnSign(restaurant.meta); //convert Tiếng Việt không dấu
                    db.restaurants.Add(restaurant);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                    //return RedirectToAction("Index", "product", new { id = restaurant.categoryid });
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,img,price,description,meta,hide,order,datebegin")] restaurant restaurant, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                restaurant temp = db.restaurants.Find(restaurant.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/restaurant"), filename);
                        img.SaveAs(path);
                        temp.img = filename; //Lưu ý
                    }
                    temp.name = restaurant.name;
                    temp.price = restaurant.price;
                    temp.description = restaurant.description;
                    temp.meta = Functions.ConvertToUnSign(restaurant.meta); //convert Tiếng Việt không dấu
                    temp.hide = restaurant.hide;
                    temp.order = restaurant.order;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                    //return RedirectToAction("Index", "restaurant", new { id = restaurant.id });
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return View(restaurant);
        }

        //// GET: Admin/Restaurants/Delete/5
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
