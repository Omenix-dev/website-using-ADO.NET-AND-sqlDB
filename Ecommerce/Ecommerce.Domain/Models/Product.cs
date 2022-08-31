using Ecommerce.Domain.Enum;

namespace Ecommerce.Domain.Models
{
    public class Product
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public int Discount { get; set; }
        public decimal Price { get; set; }
        public Availability Availability { get; set; }
        public Categories Category { get; set; }
        public bool Shipping { get; set; }
        public string Url { get; set; }
        public string Description { get; set; }
        public Ratings Rating { get; set; }
        public Product(string id, string name, int discount, decimal price, Availability availability, string category, bool shipping, string url, string description, Ratings rating)
        {
            Id = id;
            Name = name;
            Discount = discount;
            Price = price;
            Availability = availability;
            Shipping = shipping;
            Url = url;
            Description = description;
            Rating = rating;
            Category = category == "Bags" ? (Categories)0: 
                       category == "Sneakers" ? (Categories)1:
                       category == "Belt"?(Categories)2 : (Categories)3;
        }
        public Product()
        {

        }
    }
}
