using QuanLyDatPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyDatPhongKhachSan.Help
{
    public class RoomService
    {
        public List<int> GetAvailableBeds()
        {
            using (var db = new BookingHotel1Entities3())
            {
                var beds = db.rooms.Select(r => r.bed).Distinct().ToList();
                var validBeds = beds.Where(b => b != null).Select(b => b.Value).ToList();
                return validBeds;
            }
        }
    }
}
