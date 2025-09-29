using FlightInfo.Api.Domain;

public class Log
{
    public int Id { get; set; }
    public int? UserId { get; set; }
    public User? User { get; set; }

    public int? FlightId { get; set; }
    public Flight? Flight { get; set; }

    public string Action { get; set; } = string.Empty;
    public DateTime Timestamp { get; set; } = DateTime.UtcNow;
}
