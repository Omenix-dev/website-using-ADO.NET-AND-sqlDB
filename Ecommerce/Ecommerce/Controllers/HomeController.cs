using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;
using System.Diagnostics;
using System.Threading.Tasks;
using Ecommerce.Core.IServices;
using Ecommerce.Core.ViewModel;
namespace Ecommerce.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProductServices _productServices;
        public HomeController(ILogger<HomeController> logger, IProductServices productServices)
        {
            _productServices = productServices;
            _logger = logger;
        }
        public async Task<IActionResult> Index()
        {
            var homeViewModel = new HomeProductViewModel(
                                await _productServices.FirstThreeBestSales(),
                                await _productServices.FirstSixBestSales(), 
                                await _productServices.NewSales(),
                                HttpContext.Session.GetString("userId"),
                                HttpContext.Session.GetString("userEmail")); 
            return View(homeViewModel);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
