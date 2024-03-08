using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace QuanLyDatPhongKhachSan
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
                name: "TrangChu",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index" }
            );

            routes.MapRoute("Restaurant", "{type}/{meta}",
            new { controller = "Restaurant", action = "Restaurant", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "nha-hang" }
            },
            namespaces: new[] { "QuanLyDatPhongKhachSan.Controllers" });

            routes.MapRoute("Blog", "{type}/{meta}",
            new { controller = "Blog", action = "Blog", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "blog" }
            },
            namespaces: new[] { "QuanLyDatPhongKhachSan.Controllers" });

            routes.MapRoute("BlogDetail", "{type}/{meta}/{id}",
            new { controller = "Blog", action = "BlogDetail", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "blog" }
            },
            namespaces: new[] { "QuanLyDatPhongKhachSan.Controllers" });

            routes.MapRoute("Room", "{type}/{meta}",
            new { controller = "Room", action = "Rooms", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "rooms" }
            },
            namespaces: new[] { "QuanLyDatPhongKhachSan.Controllers" });

            routes.MapRoute("RoomDetail", "{type}/{meta}/{id}",
             new { controller = "Room", action = "RoomDetail", id = UrlParameter.Optional },
             new RouteValueDictionary
             {
                { "type", "rooms" }
             },
             namespaces: new[] { "ShopOnline.Controllers" });

            routes.MapRoute("Contact", "{type}/{meta}",
            new { controller = "Contact", action = "Contact", meta = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "lien-he" }
            },
            namespaces: new[] { "QuanLyDatPhongKhachSan.Controllers" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
