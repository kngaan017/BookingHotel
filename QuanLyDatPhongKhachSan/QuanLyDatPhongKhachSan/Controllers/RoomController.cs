using Microsoft.AspNet.Identity;
using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;


namespace QuanLyDatPhongKhachSan.Controllers
{
    public class RoomController : Controller
    {

        BookingHotel1Entities _db = new BookingHotel1Entities();

        // GET: Room
        public ActionResult RoomDetail(long id)
        {
            var room = _db.rooms.FirstOrDefault(r => r.roomID == id && r.hide == true);
            if (room == null)
            {
                return HttpNotFound();
            }

            var availableRooms = _db.rooms
                                    .Where(r => r.hide == true && r.roomID != id && r.available > 0) 
                                    .OrderBy(r => Guid.NewGuid())
                                    .Take(2) 
                                    .ToList();

            ViewBag.Room = room;
            ViewBag.AvailableRooms = availableRooms;

            return View();
        }
        public ActionResult Rooms()
        {
            ViewBag.meta = "phong-o";
            var rooms = _db.rooms.Where(t => t.hide == true).ToList();
            return View(rooms);
        }

        public ActionResult Booking(int id)
        {
            var room = _db.rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }

            var userId = (int)Session["UserID"];
            var user = _db.users.Find(userId);

            ViewBag.Fullname = user?.fullname;
            ViewBag.Email = user?.email;
            ViewBag.Phone = user?.phonenumber;
            ViewBag.Room = room;

            return View(room);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Reserve(FormCollection form)
        {
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] == true)
            {
                int userID = (int)Session["UserID"];
                string name = form["lname"];
                string phone = form["phone"];
                string email = form["email"];
                string requests = form["requests"];
                string startDateString = form["checkin_date"];
                string endDateString = form["checkout_date"];
                DateTime startDate = DateTime.Parse(startDateString);
                DateTime endDate = DateTime.Parse(endDateString);
                TimeSpan duration = endDate - startDate;
                int numberOfNights = duration.Days;
                float total = float.Parse(form["price"]) * numberOfNights;
                int adults = int.Parse(form["adults"]);
                int children;
                if (!int.TryParse(form["children"], out children))
                {
                    children = 0; 
                }
                int roomID = int.Parse(form["roomID"]);
                bool surcharge = form["buffet"] == "yes";

                var booking = new booking
                {
                    userID = userID,
                    name = name,
                    phone = phone,
                    email = email,
                    requests = requests,
                    startDate = startDate,
                    endDate = endDate,
                    numberOfGuest = adults + children,
                    roomID = roomID,
                    status = "Pending",
                    surcharge = surcharge,
                    total = total
                };

                _db.bookings.Add(booking);
                _db.SaveChanges();
                var room = _db.rooms.FirstOrDefault(r => r.roomID == roomID);
                if (room != null)
                {
                    room.available -= 1;
                    _db.SaveChanges();
                }
                TempData["SuccessMessage"] = "You have successfully booked your room.";
                return RedirectToAction("History", "Account");
            }
            else
            {
                TempData["ErrorMessage"] = "An error occurred while processing your rating. Please try again.";
                return RedirectToAction("Login", "Account");

            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Review(FormCollection form)
        {
            int userID = (int)Session["UserID"];
            int roomID;
            int rating;
            string comment;

            if (Session["UserID"] != null &&
                form["RoomID"] != null &&
                form["star"] != null &&
                form["Comment"] != null &&
                int.TryParse(form["RoomID"], out roomID) &&
                int.TryParse(form["star"], out rating))
            {
                comment = form["Comment"];

                var review = new review
                {
                    userID = userID,
                    roomID = roomID,
                    rating = rating,
                    comment = comment,
                    reviewDate = DateTime.Now,
                    datebegin = DateTime.Now,
                    order = 1,
                    hide = true
                };

                _db.reviews.Add(review);
                _db.SaveChanges();
                TempData["SuccessMessage"] = "You have successfully rated!";
                return RedirectToAction("History", "Account");
            }
            else
            {
                TempData["ErrorMessage"] = "An error occurred while processing your rating. Please try again.";
                return RedirectToAction("History", "Account");
            }
        }

        [HttpPost]
        public ActionResult CancelBooking(int bookingId, int roomID)
        {
            var booking = _db.bookings.Find(bookingId);
            if (booking == null)
            {
                return Json(new { success = false });
            }
            var room = _db.rooms.FirstOrDefault(r => r.roomID == roomID);
            if (room != null)
            {
                room.available += 1;
                _db.SaveChanges();
            }

            _db.bookings.Remove(booking);
            _db.SaveChanges();
            TempData["SuccessMessage"] = "Booking successfully cancelled.";
            return Json(new { success = true });
        }

        public class SearchViewModel
        {
            public List<QuanLyDatPhongKhachSan.Models.room> Rooms { get; set; }
            public List<QuanLyDatPhongKhachSan.Models.room> searchList { get; set; }
        }

        public ActionResult Search(string roomType, string max, string bed, string size, string view, int? minPrice, int? maxPrice, string search)
        {
            var searchResults = _db.rooms.Where(r =>
                (string.IsNullOrEmpty(roomType) || r.type == roomType) &&
                (string.IsNullOrEmpty(max) || r.max == max) &&
                (string.IsNullOrEmpty(bed) || r.bed.ToString() == bed) &&
                (string.IsNullOrEmpty(size) || r.size == size) &&
                (string.IsNullOrEmpty(view) || r.view == view) &&
                (!minPrice.HasValue || r.price >= minPrice.Value) &&
                (!maxPrice.HasValue || r.price <= maxPrice.Value) &&
                (string.IsNullOrEmpty(search) || r.type.Contains(search) || r.price.ToString().Contains(search) || r.size.Contains(search) || r.description.Contains(search) || r.bed.ToString().Contains(search) || r.view.Contains(search) || r.max.Contains(search))
            ).ToList();

            var rooms = _db.rooms.ToList();

            var viewModel = new SearchViewModel
            {
                searchList = searchResults,
                Rooms = rooms
            };
            ViewBag.meta = "phong-o";
            return View("Search", viewModel);
        }

    }
}