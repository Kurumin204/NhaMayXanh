using AspNetCoreHero.ToastNotification.Abstractions;
using WebFigure.Extension;
using WebFigure.Helpper;
using WebFigure.Models;
using WebFigure.ModelsView;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PayPal.Api;
using Stripe.BillingPortal;
using Stripe.Checkout;
using AspNetCore;
using PayPal;
using WebFigure.Serviece;
using Microsoft.AspNetCore.Authorization;
using NhaMayXanh.Serviece;

namespace WebFigure.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly SieuThiContext _context;
        public INotyfService _notyfService { get; }
        private readonly IVnPayService _vnPayservice;
        private readonly PaypalClient _paypalClient;

        public CheckoutController(SieuThiContext context, INotyfService notyfService, IVnPayService vnPayservice, PaypalClient paypalClient)
        {
            _context = context;
            _notyfService = notyfService;
            _vnPayservice = vnPayservice;
            _paypalClient = paypalClient;
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
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(string? returnUrl = null)
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;
            }
            //ViewData["lsTinhThanh"] = new SelectList(_context.TbLocations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
            ViewBag.GioHang = cart;
            return View(model);
        }

        public ActionResult FailureView()
        {
            return View();
        }

        public ActionResult SuccessView(string orderId)
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
            // get order info by id
            MuaHangSuccessVM successVM = new MuaHangSuccessVM();
            successVM.FullName = khachhang.FullName;
            successVM.DonHangID = orderId;
            successVM.Phone = khachhang.Phone;
            successVM.Address = khachhang.Address;
            return View("SuccessView", successVM);
        }

        public IActionResult PaymentWithPaypal(string Cancel = null)
        {
            ViewBag.PaypalClientdId = _paypalClient.ClientId;
            return View();
        }
        
        private PayPal.Api.Payment payment;
        [HttpPost]
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(MuaHangVM muaHang)
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;
                khachhang.Address = muaHang.Address;
                _context.Update(khachhang);
                _context.SaveChanges();
            }
            try
            {
                if (ModelState.IsValid)
                {
                    TbOrder donhang = new TbOrder();
                    donhang.CustomerId = model.CustomerId;
                    donhang.Address = model.Address;
                    donhang.OrderDate = DateTime.Now;
                    donhang.TransactStatusId = 1;//Don hang moi
                    donhang.Deleted = false;
                    donhang.Paid = false;

                    donhang.TotalMoney = Convert.ToInt32(cart.Sum(x => x.TotalMoney));
                    _context.Add(donhang);
                    _context.SaveChanges();

                    foreach (var item in cart)
                    {
                        TbOrderDetaill orderDetail = new TbOrderDetaill();
                        orderDetail.OrderId = donhang.OrderId;
                        orderDetail.ProductId = item.product.ProductId;
                        orderDetail.Amount = item.amount;
                        orderDetail.TotalMoney = donhang.TotalMoney;
                        orderDetail.Price = item.product.Price;
                        orderDetail.CreateDate = DateTime.Now;
                        _context.Add(orderDetail);
                    }
                    _context.SaveChanges();
                    _notyfService.Success("Đơn hàng đặt thành công");
                    return RedirectToAction("Success");
                }
            }
            catch
            {
                ViewBag.GioHang = cart;
                return View(model);
            }
            ViewBag.GioHang = cart;
            return View(model);

        }
        [Authorize]
        [HttpPost("/Checkout/create-paypal-order")]
        public async Task<IActionResult> CreatePaypalOrder(CancellationToken cancellationToken)
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            double doitien = cart.Sum(x => x.TotalMoney) / 25000;
            var tongTien = doitien.ToString();
            var donViTienTe = "USD";
            var maDonHangThamChieu = "DH" + DateTime.Now.Ticks.ToString();

            try
            {
                var response = await _paypalClient.CreateOrder(tongTien, donViTienTe, maDonHangThamChieu);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var error = new { ex.GetBaseException().Message };
                return BadRequest(error);
            }
        }

        [Authorize]
        [HttpPost("/Checkout/capture-paypal-order")]
        public async Task<IActionResult> CapturePaypalOrder(string orderID, CancellationToken cancellationToken)
        {
            try
            {
                var response = await _paypalClient.CaptureOrder(orderID);

                if (response != null)
                {
                    var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
                    var taikhoanID = HttpContext.Session.GetString("CustomerId");

                    if (taikhoanID != null)
                    {
                        var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));

                        TbOrder donhang = new TbOrder
                        {
                            CustomerId = khachhang.CustomerId,
                            Address = khachhang.Address,
                            OrderDate = DateTime.Now,
                            TransactStatusId = 1,
                            Deleted = false,
                            Paid = true,
                            TotalMoney = Convert.ToInt32(cart.Sum(x => x.TotalMoney))
                        };
                        _context.Add(donhang);
                        _context.SaveChanges();

                        foreach (var item in cart)
                        {
                            TbOrderDetaill orderDetail = new TbOrderDetaill
                            {
                                OrderId = donhang.OrderId,
                                ProductId = item.product.ProductId,
                                Amount = item.amount,
                                TotalMoney = item.amount * item.product.Price,
                                Price = item.product.Price,
                                CreateDate = DateTime.Now
                            };
                            _context.Add(orderDetail);
                        }
                        _context.SaveChanges();

                        return Json(new { success = true });
                    }
                }

                return Json(new { success = false, message = "Payment not completed" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.GetBaseException().Message });
            }
        }

        [Authorize]
        public IActionResult PaymentCallBack()
        {
            var response = _vnPayservice.PaymentExecute(Request.Query);

            if (response == null)
            {
                TempData["Message"] = "Lỗi Thanh Toán VnPay";
                return RedirectToAction("FailureView");
            }

            // Nếu thanh toán thành công, tiến hành lưu thông tin đơn hàng
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");

            if (taikhoanID != null)
            {
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));

                TbOrder donhang = new TbOrder
                {
                    CustomerId = khachhang.CustomerId,
                    Address = khachhang.Address,
                    OrderDate = DateTime.Now,
                    TransactStatusId = 1, // Đơn hàng mới
                    Deleted = false,
                    Paid = true, // Đã thanh toán
                    TotalMoney = Convert.ToInt32(cart.Sum(x => x.TotalMoney))
                };
                _context.Add(donhang);
                _context.SaveChanges();

                foreach (var item in cart)
                {
                    TbOrderDetaill orderDetail = new TbOrderDetaill
                    {
                        OrderId = donhang.OrderId,
                        ProductId = item.product.ProductId,
                        Amount = item.amount,
                        TotalMoney = donhang.TotalMoney,
                        Price = item.product.Price,
                        CreateDate = DateTime.Now
                    };
                    _context.Add(orderDetail);
                }
                _context.SaveChanges();
            }

            return RedirectToAction("Success");
        }

        public IActionResult PaymentWithVnPay()
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
            var donhang = _context.TbOrders
                .Where(x => x.CustomerId == Convert.ToInt32(taikhoanID))
                .OrderByDescending(x => x.OrderDate)
                .FirstOrDefault();

            int totalmoney = donhang.TotalMoney ?? 100000;

            var vnPayModel = new VnPaymentRequestModel
            {
                Amount = totalmoney,
                CreatedDate = DateTime.Now,
                Description = "Thanh Toán Đơn Hàng",
                FullName = "Khách Hàng",
                OrderId = new Random().Next(0, 1003333),
            };
            return Redirect(_vnPayservice.CreatePaymentUrl(HttpContext, vnPayModel));
        }

        [Route("dat-hang-thanh-cong.html", Name = "Success")]
        public IActionResult Success()
        {
            try
            {
                var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
                ViewBag.GioHang = cart;
                var taikhoanID = HttpContext.Session.GetString("CustomerId");
                if (string.IsNullOrEmpty(taikhoanID))
                {
                    return RedirectToAction("Login", "Account", new { returnUrl = "/dat-hang-thanh-cong.html" });
                }
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                var donhang = _context.TbOrders
                    .Where(x => x.CustomerId == Convert.ToInt32(taikhoanID))
                    .OrderByDescending(x => x.OrderDate)
                    .FirstOrDefault();
                MuaHangSuccessVM successVM = new MuaHangSuccessVM();
                successVM.FullName = khachhang.FullName;
                successVM.DonHangID = donhang.OrderId.ToString();
                successVM.Phone = khachhang.Phone;
                successVM.Address = khachhang.Address;
                successVM.CartItems = cart;
                HttpContext.Session.Remove("GioHang");
                return View(successVM);
                
            }
            catch
            {
                return View();
            }
        }
    }
}
