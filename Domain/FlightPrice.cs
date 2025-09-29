using System.ComponentModel.DataAnnotations;

namespace FlightInfo.Api.Domain
{
    public class FlightPrice
    {
        public int Id { get; set; }
        public int FlightId { get; set; }
        public string Class { get; set; } = ""; // Economy, Business, First
        public decimal Price { get; set; }
        public string Currency { get; set; } = "TRY";
        public int AvailableSeats { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public Flight Flight { get; set; } = null!;
    }
}