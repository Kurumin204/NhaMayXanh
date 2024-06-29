using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebFigure.Extension;
using WebFigure.ModelsView;

namespace NhaMayXanh.Controllers
{
    public class SuccessController : Controller
    {
        public IActionResult Index()
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            ViewBag.GioHang = cart;
            return View();
        }
        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }
    }
}
