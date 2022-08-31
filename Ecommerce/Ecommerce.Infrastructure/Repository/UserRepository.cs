using System.Collections.Generic;
using Ecommerce.Infrastructures.IRepository;
using System.Threading.Tasks;
using Ecommerce.Domain.Models;
using System.Linq;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
using Ecommerce.Domain.Enum;
using System;

//using Microsoft.AspNetCore.Mvc.ViewFeatures;


namespace Ecommerce.Infrastructures.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly IConfiguration _configuration;
        public UserRepository(IConfiguration config)
        {
            _configuration = config;
        }
        /// <summary>
        /// add the user instance to tyhe database
        /// </summary>
        /// <param name="user"></param>
        /// <returns>Task<bool></returns>
        public async Task<bool> Register(User user)
        {
            var connectionString = _configuration.GetSection("ConnectionStrings:Default").Value;
            try
            {
                using( SqlConnection conn = new SqlConnection(connectionString))
                {
                    var command = new SqlCommand("spRegister", conn);
                    // command type
                    command.CommandType = CommandType.StoredProcedure;

                    // parameter insertion
                    command.Parameters.Add(new SqlParameter("@UserId", user.UserId));
                    command.Parameters.Add(new SqlParameter("@Password", user.Password));
                    command.Parameters.Add(new SqlParameter("@Email", user.Email));
                    conn.Open();
                    var rowsAffected = await command.ExecuteNonQueryAsync();
                    if (rowsAffected > 0) return true;
                    return false; 
                }
                
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<User>> Login()
        {
            var connectionString = _configuration.GetSection("ConnectionStrings:Default").Value;
            try
            {
                using( SqlConnection conn = new SqlConnection(connectionString))
                {
                    var command = new SqlCommand("spLogin", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    var sqlAdapter = await Task.Run(() => new SqlDataAdapter(command));
                    var dataTable = new DataTable();
                    sqlAdapter.Fill(dataTable);
                    return dataTable.AsEnumerable()
                                    .Select(x => new User(
                                    x.Field<string>("UserId"),
                                    x.Field<string>("Email"),
                                    x.Field<string>("Password")
                                    )).ToList();
                }
            }
            catch
            {
                return new List<User>();
            }

        }
    }
}
