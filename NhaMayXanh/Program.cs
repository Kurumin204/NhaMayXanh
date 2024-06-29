using AspNetCoreHero.ToastNotification;
using WebFigure.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Configuration;
using System.Security.Policy;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using Stripe;
using WebFigure.Serviece;
using NhaMayXanh.Serviece;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Load configurations from web.config

// Add configuration to builder
// Add services to the container.
builder.Services.AddControllersWithViews();
//Ket noi sql
{
    var connectString = builder.Configuration.GetConnectionString("WebShopConnectionString");
    builder.Services.AddDbContext<SieuThiContext>(options => options.UseSqlServer(connectString));

    builder.Services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));
    builder.Services.AddSingleton(x => new PaypalClient(
        builder.Configuration["PaypalOptions:setting:clientId"],
        builder.Configuration["PaypalOptions:setting:clientSecret"],
        builder.Configuration["PaypalOptions:setting:mode"]
        ));
    builder.Services.AddSingleton<IVnPayService, VnPayService>();

    builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
    builder.Services.AddSession();
    builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
          .AddCookie(p =>
          {
          
              p.LoginPath = "/dang-nhap.html";
              //p.LogoutPath = "/dang-xuat/html";
              p.AccessDeniedPath = "/not-found.html";
          });
    builder.Services.AddMvc(o =>
    {
        o.Filters.Add(new AuthorizeFilter(new AuthorizationPolicyBuilder().RequireAuthenticatedUser().Build()));
    });
    builder.Services.AddNotyf(config => { config.DurationInSeconds = 10; config.IsDismissable = true; config.Position = NotyfPosition.BottomRight; });
}



var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}


app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSession();
app.UseRouting();

StripeConfiguration.ApiKey = builder.Configuration.GetSection("Stripe:SecretKey").Get<string>();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
            name: "areas",
            pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
          );
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();



