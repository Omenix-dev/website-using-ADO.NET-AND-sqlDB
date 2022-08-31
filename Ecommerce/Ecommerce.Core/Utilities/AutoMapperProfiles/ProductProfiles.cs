using AutoMapper;
using Ecommerce.Domain.Models;
using Ecommerce.Domain.DTO;

namespace Ecommerce.Core.Utilities.AutoMapperProfiles
{
    public class ProductProfiles: Profile
    {
        public ProductProfiles()
        {
            CreateMap<Product, ProductDisplayDTO>();
        }
    }
}
