namespace FlightInfo.Api.DTOs
{
    public class CityDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public int CountryId { get; set; }
        public string FlightTime { get; set; } = "";
        public List<AirportDto> Airports { get; set; } = new List<AirportDto>();
    }
}
