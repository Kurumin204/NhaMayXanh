using WebFigure.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;

namespace WebFigure.Controllers
{
    public class ProductController : Controller
    {
        private readonly SieuThiContext _context;
        public ProductController(SieuThiContext context)
        {
            _context = context;
        }
        [Route("shop.html", Name = ("ShopProduct"))]
        public IActionResult Index(int? page, string keyword, int sortOrder = 1)
        {
            try
            {

                var pageNumber = page ?? 1;
                var pageSize = 10;
                var lsTinDangs = _context.TbProducts.AsNoTracking();


                // Nếu có từ khóa tìm kiếm, lọc dữ liệu
                if (!string.IsNullOrEmpty(keyword))
                {
                    lsTinDangs = lsTinDangs.Where(x => x.ProductName.Contains(keyword));
                }


                // Sắp xếp dữ liệu trước khi chuyển đến ToPagedList
                lsTinDangs = lsTinDangs.OrderBy(x => x.DateCreated);

                var models = lsTinDangs.ToPagedList(pageNumber, pageSize);

                ViewBag.CurrentPage = pageNumber;
                ViewBag.Keyword = keyword;
                return View(models);
            }

            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }



        [Route("danhmuc/{Alias}", Name = ("ListProduct"))]
        public IActionResult List(string Alias, int page = 1)
        {
            try
            {
                var pageSize = 10;
                var danhmuc = _context.TbCategories.AsNoTracking().SingleOrDefault(x => x.Alias == Alias);

                var lsTinDangs = _context.TbProducts
                    .AsNoTracking()
                    .Where(x => x.CatllD == danhmuc.CatlId && x.Active)
                    .OrderByDescending(x => x.DateCreated);

                PagedList<TbProduct> models = new PagedList<TbProduct>(lsTinDangs, page, pageSize);
                ViewBag.CurrentPage = page;
                ViewBag.CurrentCat = danhmuc;
                return View(models);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [Route("/{Alias}-{id}.html", Name = ("ProductDetails"))]
        public IActionResult Details(int id)
        {
            var product = _context.TbProducts.Include(x => x.CatllDNavigation).FirstOrDefault(x => x.ProductId == id);
            if (product == null)
            {
                return RedirectToAction("Index");
            }
            var lsProduct = _context.TbProducts
                .AsNoTracking()
                .Where(x => x.CatllD == product.CatllD && x.ProductId != id && x.Active == true)
                .Take(4)
                .OrderByDescending(x => x.DateCreated)
                .ToList();
            ViewBag.SanPham = lsProduct;
            return View(product);
        }
    }
}
