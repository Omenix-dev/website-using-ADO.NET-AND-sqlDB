using Ecommerce.Domain.Models;
using System.Threading.Tasks;

namespace Ecommerce.Core.IServices
{
    public interface IUserServices
    {
        Task<string> LoginAsync(UserLoginDetails userDetail);
        Task<User> RegisterUserAsync(UserRegistration user);
    }
}