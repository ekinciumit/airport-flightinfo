namespace FlightInfo.Api.Domain
{
    public enum ReservationStatus
    {
        Active = 1,
        Cancelled = 2
    }

    public class Reservation
    {
        public int Id { get; set; }

        // FK'lar
        public int UserId { get; set; }
        public int FlightId { get; set; }

        public ReservationStatus Status { get; set; } = ReservationStatus.Active;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime? CancelledAt { get; set; }

        // Navigation
        public User? User { get; set; }
        public Flight? Flight { get; set; }
    }
}