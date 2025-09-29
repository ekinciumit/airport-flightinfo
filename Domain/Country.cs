using System.Collections.Generic;

namespace FlightInfo.Api.Domain
{
    public class Country
    {
        public int Id { get; set; }
        public string Code { get; set; } = ""; // E.g., TR, DE, US
        public string Name { get; set; } = "";
        public ICollection<City> Cities { get; set; } = new List<City>();
    }
}