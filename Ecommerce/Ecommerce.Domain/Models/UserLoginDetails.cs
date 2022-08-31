using System.ComponentModel.DataAnnotations;

namespace Ecommerce.Domain.Models
{
    public class UserLoginDetails
    {
        [Required(ErrorMessage = "Enter to your email login")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Enter your password to Login")]
        public string Password { get; set; }
        public UserLoginDetails(string email = null, string password = null)
        {
            Email = email;
            Password = password;
        }
        public UserLoginDetails()
        {

        }
    }
}
