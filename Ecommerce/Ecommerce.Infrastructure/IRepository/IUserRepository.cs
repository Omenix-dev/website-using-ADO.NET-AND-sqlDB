using Ecommerce.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ecommerce.Infrastructures.IRepository
{
    public interface IUserRepository
    {
        Task<List<User>> Login();
        Task<bool> Register(User user);
    }
}