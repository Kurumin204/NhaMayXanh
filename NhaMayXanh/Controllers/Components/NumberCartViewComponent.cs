using WebFigure.Extension;
using WebFigure.ModelsView;
using Microsoft.AspNetCore.Mvc;

namespace WebFigure.Controllers.Components
{
	public class NumberCartViewComponent : ViewComponent
	{
		public IViewComponentResult Invoke()
		{
			var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
			return View(cart);
		}
	}
}
