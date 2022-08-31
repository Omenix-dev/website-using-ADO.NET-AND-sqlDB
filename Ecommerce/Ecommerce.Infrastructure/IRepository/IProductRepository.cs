using Ecommerce.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ecommerce.Infrastructures.IRepository
{
    public interface IProductRepository
    {
        Task<List<Product>> GetAllProductAsync();
        bool SaveProduct();
    }
}