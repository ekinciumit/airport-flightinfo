using System.Collections.Generic;

namespace FlightInfo.Api.Domain
{
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public int CountryId { get; set; }
        public string FlightTime { get; set; } = ""; // E.g., "3-4 saat", "11 saat"

        public Country Country { get; set; } = null!;
        public ICollection<Airport> Airports { get; set; } = new List<Airport>();
    }
}