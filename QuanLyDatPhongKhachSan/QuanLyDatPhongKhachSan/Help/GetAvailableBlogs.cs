using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyDatPhongKhachSan.Help
{
    public class BlogService
    {
        public List<string> GetAvailableBlogs()
        {
            using (var db = new BookingHotel1Entities3())
            {
                var blogs = db.blogs.Select(r => r.tag).Distinct().ToList();
                var validBlogs = blogs.Where(b => b != null).ToList();
                return validBlogs;
            }
        }
    }
}

