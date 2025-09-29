using FlightInfo.Api.DTOs;

namespace FlightInfo.Api.Services
{
    public interface IReservationService
    {
        Task<ReservationDto> CreateReservationAsync(int userId, int flightId);
        Task<ReservationDto?> GetReservationAsync(int id, int userId);
        Task<IEnumerable<ReservationDto>> GetUserReservationsAsync(int userId, string? status = null);
        Task<bool> CancelReservationAsync(int id, int userId);
        Task<ReservationDto> RestoreReservationAsync(int id, int userId);
        Task<IEnumerable<object>> GetAllReservationsAsync(string? status = null);
    }
}


