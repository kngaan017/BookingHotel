using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatPhongKhachSan.Controllers
{
    public class AccountController : Controller
    {
        BookingHotel1Entities5 _db = new BookingHotel1Entities5();

        // GET: Account
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult History()
        {
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] == true)
            {
                int userID = (int)Session["UserID"];
                var userBookings = _db.bookings.Where(b => b.userID == userID).ToList();
                return View(userBookings);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(password);
                var user = _db.users.FirstOrDefault(s => s.email.Equals(email) && s.password.Equals(f_password));
                if (user != null)
                {
                    // Lưu thông tin người dùng vào session
                    Session["UserID"] = user.userID;
                    Session["UserName"] = user.username;
                    Session["UserRole"] = user.role.Trim();
                    Session["IsLoggedIn"] = true;

                    if (user.role.Trim().Equals("admin"))
                    {
                        return RedirectToAction("Index", "Account", new { area = "Admin" });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.Error = "Invalid email or password";
                    return View();
                }
            }
            else
            {
                ViewBag.Error = "Login failed";
                return View();
            }
        }

        
        public ActionResult Logout()
        {
            Session.Clear(); // Clear all session variables
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(user _user)
        {
            if (ModelState.IsValid)
            {
                user user = new user
                {
                    username = _user.username,
                    role = "user",
                    email = _user.email,
                    hide = true,
                    order = 1,
                    datebegin = DateTime.Now
                };
                var check = _db.users.FirstOrDefault(s => s.email == _user.email);
                if (check == null)
                {
                    user.password = GetMD5(_user.password);
                    _db.Configuration.ValidateOnSaveEnabled = false;
                    _db.users.Add(user);
                    _db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }
            }
            return View(_user);
        }

        public static string GetMD5(string s)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(s);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;
            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString();
            }
            return byte2String;
        }
    }
}