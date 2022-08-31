using Ecommerce.Domain.Models;
using Ecommerce.Domain.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ecommerce.Core.IServices
{
    public interface IProductServices
    {
        Task<Product> GetProductByIdAsync(string id);
        bool SaveProduct();
        Task<List<ProductDisplayDTO>> FirstSixBestSalesAsync();
        Task<List<ProductDisplayDTO>> FirstThreeBestSalesAsync();
        Task<List<ProductDisplayDTO>> NewSalesAsync();
    }
}