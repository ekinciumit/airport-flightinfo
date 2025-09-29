namespace FlightInfo.Api.DTOs
{
    public class ReservationDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int FlightId { get; set; }

        public string FlightNumber { get; set; } = string.Empty;
        public string Origin { get; set; } = string.Empty;
        public string Destination { get; set; } = string.Empty;
        public DateTime DepartureTime { get; set; }
        public DateTime ArrivalTime { get; set; }

        public string Status { get; set; } = "Active";
        public DateTime CreatedAt { get; set; }
        public DateTime? CancelledAt { get; set; }
    }
}