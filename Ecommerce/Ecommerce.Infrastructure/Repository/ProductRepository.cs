using Ecommerce.Domain.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Ecommerce.Infrastructures.IRepository;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using Ecommerce.Domain.Enum;
using System;
namespace Ecommerce.Infrastructures.Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly IConfiguration _configuration;
        public ProductRepository(IConfiguration config)
        {
            _configuration = config;
        }
        public async Task<List<Product>> GetAllProductAsync()
        {
            var connectionString = _configuration.GetSection("ConnectionStrings:Default").Value;
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    var command = new SqlCommand("spGetAllProducts", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    var sqlAdapter = await Task.Run(() => new SqlDataAdapter(command));
                    var dataTable = new DataTable();
                    sqlAdapter.Fill(dataTable);
                    return dataTable.AsEnumerable()
                                    .Select(x => new Product(
                                    x.Field<string>("Id"),
                                    x.Field<string>("Name"),
                                    x.Field<int>("Discount"),
                                    x.Field<decimal>("Price"),
                                    (Availability)Convert.ToInt32(x.Field<bool>("Availability")),
                                    x.Field<string>("CategoryName"),
                                    x.Field<bool>("Shiping"),
                                    x.Field<string>("Url"),
                                    x.Field<string>("Description"),
                                    x.Field<Ratings>("RatingLevel")
                                    )).ToList();
                }
            }
            catch
            {
                return null;
            }

            
        }
        public bool SaveProduct()
        {
           return false;
        }
    }
}
