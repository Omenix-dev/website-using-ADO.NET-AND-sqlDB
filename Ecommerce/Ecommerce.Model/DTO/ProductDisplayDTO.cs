using Ecommerce.Enum;

namespace Ecommerce.Model.DTO
{
    public class ProductDisplayDTO
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public Ratings Rating { get; set; }
        public decimal Price { get; set; }
        public int Discount { get; set; }
        public string Url { get;set; }
        public decimal PriceDiscount
        {
            get
            {
                return (((decimal)Discount / 100) * (decimal)Price);
            }
        }
    }
}
