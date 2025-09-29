namespace FlightInfo.Api.Domain
{
    public class FlightStatusHistory
    {
        public int Id { get; set; }
        public int FlightId { get; set; }
        public string Status { get; set; } = "";
        public DateTime ChangedAt { get; set; } = DateTime.UtcNow;
        public string? Reason { get; set; }

        public Flight Flight { get; set; } = null!;
    }
}