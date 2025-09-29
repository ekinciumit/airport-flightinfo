namespace FlightInfo.Api.DTOs
{
    public class LogDto
    {
        public int Id { get; set; }
        public string Action { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; }
        public string? UserEmail { get; set; }
        public string? UserFullName { get; set; }
        public string? FlightNumber { get; set; }
    }
}