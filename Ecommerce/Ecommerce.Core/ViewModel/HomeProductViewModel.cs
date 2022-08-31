using System.Collections.Generic;
using Ecommerce.Domain.DTO;
using Ecommerce.Domain.Models;

namespace Ecommerce.Core.ViewModel
{
    public class HomeProductViewModel
    {
        public List<ProductDisplayDTO> FirstThreeBestSales { get; set; }
        public List<ProductDisplayDTO> FirstSixBestSales { get; set; }
        public List<ProductDisplayDTO> NewSales { get; set; }
        public string SessionId { get; set; }
        public string Email { get; set; }
        public Product Product { get; set; }
        public string UserId { get; set; }
        public string UserEmail { get; set; }

        public HomeProductViewModel(List<ProductDisplayDTO> FirstThreeBestSales = null,
                                    List<ProductDisplayDTO> FirstSixBestSales = null,
                                    List<ProductDisplayDTO> NewSales = null,
                                    string sessionId = null,
                                    string email = null)
        {
            this.NewSales = NewSales;
            this.FirstThreeBestSales = FirstThreeBestSales;
            this.FirstSixBestSales = FirstSixBestSales;
            SessionId = sessionId;
            Email = email;
        }
        public HomeProductViewModel()
        {

        }
    }
}
