using Ecommerce.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ecommerce.Infrastructures.IRepository
{
    public interface IUserRepository
    {
        Task<List<User>> LoginAsync();
        Task<bool> RegisterAsync(User user);
    }
}