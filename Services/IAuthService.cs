using FlightInfo.Api.Domain;

namespace FlightInfo.Api.Services
{
    public interface IAuthService
    {
        Task<(bool Success, string Message)> RegisterAsync(string email, string fullName, string password);
        Task<(bool Success, string Token, object? User)> LoginAsync(string email, string password);
        string GenerateJwtToken(User user);
        void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt);
        bool VerifyPasswordHash(string password, byte[] storedHash, byte[] storedSalt);
    }
}


