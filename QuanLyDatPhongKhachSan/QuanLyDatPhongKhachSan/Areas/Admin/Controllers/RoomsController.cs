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
    public class RoomsController : Controller
    {
        private BookingHotel1Entities3 db = new BookingHotel1Entities3();

        // GET: Admin/Rooms
        public ActionResult Index()
        {
            var distinctMaxValuesString = db.rooms.Select(r => r.bed).Distinct().ToList();

            ViewBag.MaxValues = distinctMaxValuesString;

            var rooms = db.rooms.ToList();

            return View(rooms);
        }



        // GET: Admin/Rooms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            room room = db.rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // GET: Admin/Rooms/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Rooms/Create


        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "roomID,type,price,size,img1,img2,img3,description,view,bed,max,meta,hide,order,datebegin")] room room, HttpPostedFileBase img1, HttpPostedFileBase img2, HttpPostedFileBase img3, string bed)
        {
            try
            {
                var path = "";
                var filename = "";
                room.bed = Convert.ToInt32(bed);

                if (ModelState.IsValid)
                {
                    
                    if (img1 != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img1.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img1.SaveAs(path);
                        room.img1 = filename; //Lưu ý
                    }
                    if(img2 != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img2.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img2.SaveAs(path);
                        room.img2 = filename; //Lưu ý
                    }
                    if(img3 != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img3.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img3.SaveAs(path);
                        room.img3 = filename;
                    }
                    else
                    {
                        room.img1 = "room-1.jpg";
                        room.img2 = "room-2.jpg";
                        room.img3 = "room-3.jpg";
                    }
                    room.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    room.meta = Functions.ConvertToUnSign(room.meta); //convert Tiếng Việt không dấu
                    db.rooms.Add(room);
                    db.SaveChanges();
                    return RedirectToAction("Index");
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
            return View(room);
        }


        // GET: Admin/Rooms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            room room = db.rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // POST: Admin/Rooms/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "roomID,type,price,size,img1,img2,img3,description,view,bed,max,meta,hide,order,datebegin")] room room)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(room).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(room);
        //}
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "roomID,type,price,size,img1,img2,img3,description,view,bed,max,meta,hide,order,datebegin")] room room, HttpPostedFileBase img1, HttpPostedFileBase img2, HttpPostedFileBase img3)
        {
            try
            {
                var path = "";
                var filename = "";
                room temp = db.rooms.Find(room.roomID);
                if (ModelState.IsValid)
                {
                    if (img1 != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img1.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img1.SaveAs(path);
                        temp.img1 = filename;
                    }

                    if (img2 != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img2.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img2.SaveAs(path);
                        temp.img2 = filename;
                    }

                    if (img3 != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img3.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/Admin/Content/upload/img/room"), filename);
                        img3.SaveAs(path);
                        temp.img3 = filename;
                    }
                    temp.type = room.type;
                    temp.price = room.price;
                    temp.description = room.description;
                    temp.meta = Functions.ConvertToUnSign(room.meta); //convert Tiếng Việt không dấu
                    temp.hide = room.hide;
                    temp.order = room.order;
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

            return View(room);
        }

        // GET: Admin/Rooms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            room room = db.rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // POST: Admin/Rooms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            room room = db.rooms.Find(id);
            db.rooms.Remove(room);
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
