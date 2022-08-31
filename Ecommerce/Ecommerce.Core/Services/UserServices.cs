using Ecommerce.Infrastructures.IRepository;
using System.Threading.Tasks;
using Ecommerce.Core.IServices;
using EasyEncryption;
using System.Linq;
using Ecommerce.Domain.Models;



namespace Ecommerce.Core.Services
{
	public class UserServices : IUserServices
	{
		private readonly IUserRepository _repository;
		public UserServices(IUserRepository productRepo)
		{
			_repository = productRepo;
		}
		/// <summary>
		/// Registers the uswer to the back end
		/// returns an awaitable 
		/// </summary>
		/// <param name="email"></param>
		/// <param name="password"></param>
		/// <returns>Task<User></returns>
		public async Task<User> RegisterUser(UserRegistration user)
		{
			User newUser = new User(user.Email,SHA.ComputeSHA256Hash(user.Password));
			bool IsRegistered = await _repository.Register(newUser);
			if (IsRegistered)
			{
				return newUser;
			}
			return null;
		}
		/// <summary>
		/// Provides the Logic for the user Login
		/// and awaitable
		/// </summary>
		/// <param name="email"></param>
		/// <param name="password"></param>
		/// <returns>string</returns>
		public async Task<string> Login(UserLoginDetails userDetail)
		{
			var allUser = await _repository.Login();
            var user = allUser.FirstOrDefault(x => x.Email == userDetail.Email && x.Password == SHA.ComputeSHA256Hash(userDetail.Password));
            if (user != null)
            {
                return user.UserId;
            }
            return "NOT_FOUND";
		}
	}
}
