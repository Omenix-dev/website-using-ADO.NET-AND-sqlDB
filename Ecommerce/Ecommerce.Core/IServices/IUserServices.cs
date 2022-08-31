using Ecommerce.Domain.Models;
using System.Threading.Tasks;

namespace Ecommerce.Core.IServices
{
    public interface IUserServices
    {
        Task<string> Login(UserLoginDetails userDetail);
        Task<User> RegisterUser(UserRegistration user);
    }
}