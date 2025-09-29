﻿namespace FlightInfo.Api.DTOs
{
    public class UserDto
    {
        public int Id { get; set; }

        // Username yerine Email ve FullName
        public string Email { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;

        // Role enum olduğu için string'e çevrilmiş değerini tutuyoruz
        public string Role { get; set; } = "User";

        public DateTime CreatedAt { get; set; }
    }
}