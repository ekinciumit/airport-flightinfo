namespace FlightInfo.Api.DTOs
{
    public class AirportDto
    {
        public int Id { get; set; }
        public string Code { get; set; } = "";
        public string Name { get; set; } = "";
        public int CityId { get; set; }
    }
}


