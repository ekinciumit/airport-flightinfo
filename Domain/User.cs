namespace FlightInfo.Api.Domain
{

    public enum Role
    {
        User = 0,
        Admin = 1
    }

    public class User
    {
        public int Id { get; set; }
        public string Email { get; set; } = null!;
        public string FullName { get; set; } = null!;

        // Şifre alanları (hash + salt)
        public byte[] PasswordHash { get; set; } = new byte[0];
        public byte[] PasswordSalt { get; set; } = new byte[0];


        // Rol
        public Role Role { get; set; } = Role.User;

        // Soft-delete / audit alanların varsa bırak
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public bool IsDeleted { get; set; } = false;
    }

}