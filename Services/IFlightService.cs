using FlightInfo.Api.DTOs;

namespace FlightInfo.Api.Services
{
    public interface IFlightService
    {
        Task<IEnumerable<FlightDto>> GetFlightsAsync();
        Task<IEnumerable<FlightDto>> SearchFlightsAsync(FlightSearchCriteria criteria);
        Task<IEnumerable<object>> GetFlightsWithPricesAsync();
        Task<IEnumerable<object>> GetFlightPricesAsync(int flightId);
        Task<object> GetFlightStatusAsync(int flightId);
        Task<FlightDto?> GetFlightAsync(int id);
        Task<FlightDto> CreateFlightAsync(FlightDto flightDto);
        Task<FlightDto> UpdateFlightAsync(int id, FlightDto flightDto);
        Task<bool> DeleteFlightAsync(int id);
        Task<FlightDto> RestoreFlightAsync(int id);
        Task<IEnumerable<FlightDto>> GetDeletedFlightsAsync();
    }

    public class FlightSearchCriteria
    {
        public string? Origin { get; set; }
        public string? Destination { get; set; }
        public DateTime? DepartureDate { get; set; }
        public DateTime? ReturnDate { get; set; }
        public string? ClassType { get; set; } = "Economy";
        public int? Passengers { get; set; } = 1;
        public string? Status { get; set; } = "Scheduled";
    }
}


