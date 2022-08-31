using Ecommerce.Core.IServices;
using System.Linq;
using Ecommerce.Domain.Models;
using Ecommerce.Domain.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using Ecommerce.Infrastructures.IRepository;

namespace Ecommerce.Core.Services
{
    public class ProductServices : IProductServices
    {
        private readonly IProductRepository _repository;
        private readonly IMapper _mapper;
        public ProductServices(IProductRepository repository,IMapper mapper)
        {
            _mapper = mapper;
            _repository = repository;
        }

        /// <summary>
        /// return a single product that matches the ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Product</returns>
        public async Task<Product> GetProductById(string id)
        {
            var allproductDetail = await _repository.GetAllProductAsync();
            return allproductDetail.FirstOrDefault(x => x.Id == id);
        }
        /// <summary>
        /// this method is used to return all the available product in the json file
        /// </summary>
        /// <returns>Task<List<ProductDisplayDTO>></returns>
        private async Task<List<ProductDisplayDTO>> GetAllProductsAsync()
        {
            var allProducts = await _repository.GetAllProductAsync();
            var allProductDisplay = new List<ProductDisplayDTO>();
            if(allProducts != null)
            {
                foreach (var product in allProducts)
                {
                    var item = _mapper.Map<ProductDisplayDTO>(product);
                    allProductDisplay.Add(item);
                }
                return allProductDisplay;
            }
            return null;
        }
        public bool SaveProduct()
        {
            return _repository.SaveProduct();
        }
        /// <summary>
        /// this method return the first three sales with highest discount
        /// </summary>
        /// <returns>Task<List<ProductDisplayDTO>></returns>
        public async Task<List<ProductDisplayDTO>> FirstThreeBestSales()
        { 
            var productItems = await GetAllProductsAsync();
            if (productItems != null)
            return productItems.OrderByDescending(x => x.Discount).Take(3).ToList();
            return null;
        }
        /// <summary>
        /// this method return the first six sales with highest discount
        /// </summary>
        /// <returns>Task<List<ProductDisplayDTO>></returns>
        public async Task<List<ProductDisplayDTO>> FirstSixBestSales()
        {
            var productItems = await GetAllProductsAsync();
            if(productItems != null)
            return productItems.OrderByDescending(x => x.Discount).Take(8).ToList();
            return null;
        }
        /// <summary>
        /// this method return the first three items that has been recently added
        /// </summary>
        /// <returns>Task<List<ProductDisplayDTO>></returns>
        public async Task<List<ProductDisplayDTO>> NewSales()
        {
            var productItems = await GetAllProductsAsync();
            if( productItems != null)
            return productItems.OrderBy(x => x.Discount).Take(3).ToList();
            return null;
        }
    }
}
