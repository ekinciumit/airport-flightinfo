namespace FlightInfo.Api.DTOs
{
    public class CountryDto
    {
        public int Id { get; set; }
        public string Code { get; set; } = "";
        public string Name { get; set; } = "";
        public List<CityDto> Cities { get; set; } = new List<CityDto>();
    }
}
