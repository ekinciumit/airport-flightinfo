using FlightInfo.Api.Domain;

namespace FlightInfo.Api.DTOs
{
    public class UpdateUserRequest
    {
        public string FullName { get; set; } = string.Empty;
        public Role Role { get; set; } = Role.User;
    }
}


