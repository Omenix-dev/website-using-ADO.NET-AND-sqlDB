using System;

namespace Ecommerce.Domain.Models
{
	public class User
	{
		public string UserId { get; set; }
		public string Email { get; set; }
		public string Password { get; set; }
		// contructor for create a user for registeration
		public User(string email, string password)
		{
			UserId = Guid.NewGuid().ToString();
			Email = email;
			Password = password;
		}
		// constructor for the retrieving and packaging
		// data for the backend login authentication
		public User(string userId,string email,string password)
		{
			UserId=userId;
			Email = email;
			Password=password;
		}
	}
}
