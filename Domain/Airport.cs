namespace FlightInfo.Api.Domain
{
    public class Airport
    {
        public int Id { get; set; }
        public string Code { get; set; } = ""; // E.g., IST, SAW, JFK
        public string Name { get; set; } = "";
        public int CityId { get; set; }
        
        public City City { get; set; } = null!;
    }
}
