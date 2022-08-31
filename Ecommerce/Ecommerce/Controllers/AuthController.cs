using Microsoft.AspNetCore.Mvc;
using Ecommerce.Core.IServices;
using Ecommerce.Domain.Models;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
namespace Ecommerce.Controllers
{
    public class AuthController : Controller
    {
        private readonly IUserServices _userServices;
        public AuthController(IUserServices userServices)
        {
            _userServices = userServices;
        }
        public IActionResult Login()
        {
            UserLoginDetails userDetails = new UserLoginDetails(HttpContext.Session.GetString("userEmail"), HttpContext.Session.GetString("userPass"));
            return View(userDetails);
        }
        [HttpPost]
        public async Task<IActionResult> Login(UserLoginDetails user)
        {
            if(ModelState.IsValid)
            {
                var userId = await _userServices.LoginAsync(user);
                if (userId != "NOT_FOUND")
                {
                    HttpContext.Session.SetString("userId", userId);
                    HttpContext.Session.SetString("userEmail", user.Email);
                    return RedirectToAction("Index", "Home");
                }
            }
            ModelState.AddModelError("Email", "this record  doesnt exist in the data base");
            return View(user);
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(UserRegistration user)
        {
            if(user.RetypePassword != user.Password)
            {
                ModelState.AddModelError("RetypePassword", "the Password those not match");
            }
            if (ModelState.IsValid)
            {
                var userInfo = await _userServices.RegisterUserAsync(user);
                if (userInfo != null)
                {
                    HttpContext.Session.SetString("userId", userInfo.UserId);
                    HttpContext.Session.SetString("userEmail", userInfo.Email);
                    HttpContext.Session.SetString("userPass", user.Password);
                    return RedirectToAction("Login");
                }
                else
                {
                    ModelState.AddModelError("Email", "this email already exist");
                    return View(user);
                }
            }
            return View(user);
        }
    }
}
