using FlightInfo.Api.Data;
using FlightInfo.Api.Domain;
using FlightInfo.Api.DTOs;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Services
{
    public class ReservationService : IReservationService
    {
        private readonly AppDbContext _context;
        private readonly ILogService _log;

        public ReservationService(AppDbContext context, ILogService log)
        {
            _context = context;
            _log = log;
        }

        public async Task<ReservationDto> CreateReservationAsync(int userId, int flightId)
        {
            var flight = await _context.Flights.FirstOrDefaultAsync(f => f.Id == flightId);
            if (flight is null || flight.Status == "Deleted" || flight.Status == "Cancelled")
                throw new InvalidOperationException("Uçuş rezervasyona uygun değil.");

            var exists = await _context.Reservations.AnyAsync(r =>
                r.UserId == userId && r.FlightId == flightId && r.Status == ReservationStatus.Active);

            if (exists)
                throw new InvalidOperationException("Bu uçuş için zaten aktif bir rezervasyonunuz var.");

            var reservation = new Reservation
            {
                UserId = userId,
                FlightId = flightId,
                Status = ReservationStatus.Active,
                CreatedAt = DateTime.UtcNow
            };

            _context.Reservations.Add(reservation);
            await _context.SaveChangesAsync();

            await _log.LogAsync("Reservation Created", userId, flightId);

            return await GetReservationDtoAsync(reservation.Id);
        }

        public async Task<ReservationDto?> GetReservationAsync(int id, int userId)
        {
            var reservation = await _context.Reservations
                .Include(r => r.Flight)
                .Where(r => r.Id == id && r.UserId == userId)
                .Select(r => new ReservationDto
                {
                    Id = r.Id,
                    UserId = r.UserId,
                    FlightId = r.FlightId,
                    FlightNumber = r.Flight!.FlightNumber,
                    Origin = r.Flight!.Origin,
                    Destination = r.Flight!.Destination,
                    DepartureTime = r.Flight!.DepartureTime,
                    ArrivalTime = r.Flight!.ArrivalTime,
                    Status = r.Status.ToString(),
                    CreatedAt = r.CreatedAt,
                    CancelledAt = r.CancelledAt
                })
                .FirstOrDefaultAsync();

            return reservation;
        }

        public async Task<IEnumerable<ReservationDto>> GetUserReservationsAsync(int userId, string? status = null)
        {
            IQueryable<Reservation> query = _context.Reservations
                .Include(r => r.Flight)
                .Where(r => r.UserId == userId);

            if (!string.IsNullOrWhiteSpace(status) &&
                Enum.TryParse<ReservationStatus>(status, true, out var s))
            {
                query = query.Where(r => r.Status == s);
            }

            var reservations = await query
                .OrderByDescending(r => r.CreatedAt)
                .Select(r => new ReservationDto
                {
                    Id = r.Id,
                    UserId = r.UserId,
                    FlightId = r.FlightId,
                    FlightNumber = r.Flight!.FlightNumber,
                    Origin = r.Flight!.Origin,
                    Destination = r.Flight!.Destination,
                    DepartureTime = r.Flight!.DepartureTime,
                    ArrivalTime = r.Flight!.ArrivalTime,
                    Status = r.Status.ToString(),
                    CreatedAt = r.CreatedAt,
                    CancelledAt = r.CancelledAt
                })
                .ToListAsync();

            return reservations;
        }

        public async Task<bool> CancelReservationAsync(int id, int userId)
        {
            var reservation = await _context.Reservations.FindAsync(id);
            if (reservation is null) return false;

            if (reservation.UserId != userId)
                throw new UnauthorizedAccessException("Bu rezervasyona erişim yetkiniz yok.");

            if (reservation.Status == ReservationStatus.Cancelled)
                throw new InvalidOperationException("Rezervasyon zaten iptal edilmiş.");

            reservation.Status = ReservationStatus.Cancelled;
            reservation.CancelledAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            await _log.LogAsync("Reservation Cancelled", userId, reservation.FlightId);

            return true;
        }

        public async Task<ReservationDto> RestoreReservationAsync(int id, int userId)
        {
            var reservation = await _context.Reservations.FindAsync(id);
            if (reservation is null)
                throw new ArgumentException("Rezervasyon bulunamadı.");

            if (reservation.UserId != userId)
                throw new UnauthorizedAccessException("Bu rezervasyona erişim yetkiniz yok.");

            if (reservation.Status != ReservationStatus.Cancelled)
                throw new InvalidOperationException("Bu rezervasyon zaten aktif.");

            reservation.Status = ReservationStatus.Active;
            reservation.CancelledAt = null;

            await _context.SaveChangesAsync();
            await _log.LogAsync("Reservation Restored", userId, reservation.FlightId);

            return await GetReservationDtoAsync(reservation.Id);
        }

        public async Task<IEnumerable<object>> GetAllReservationsAsync(string? status = null)
        {
            IQueryable<Reservation> query = _context.Reservations
                .Include(r => r.Flight)
                .Include(r => r.User);

            if (!string.IsNullOrWhiteSpace(status) &&
                Enum.TryParse<ReservationStatus>(status, true, out var s))
            {
                query = query.Where(r => r.Status == s);
            }

            var reservations = await query
                .OrderByDescending(r => r.CreatedAt)
                .Select(r => new
                {
                    r.Id,
                    r.UserId,
                    UserEmail = r.User!.Email,
                    r.FlightId,
                    r.Flight!.FlightNumber,
                    r.Flight.Origin,
                    r.Flight.Destination,
                    r.Flight.DepartureTime,
                    r.Flight.ArrivalTime,
                    Status = r.Status.ToString(),
                    r.CreatedAt,
                    r.CancelledAt
                })
                .ToListAsync();

            return reservations;
        }

        private async Task<ReservationDto> GetReservationDtoAsync(int reservationId)
        {
            return await _context.Reservations
                .Where(r => r.Id == reservationId)
                .Select(r => new ReservationDto
                {
                    Id = r.Id,
                    UserId = r.UserId,
                    FlightId = r.FlightId,
                    FlightNumber = r.Flight!.FlightNumber,
                    Origin = r.Flight!.Origin,
                    Destination = r.Flight!.Destination,
                    DepartureTime = r.Flight!.DepartureTime,
                    ArrivalTime = r.Flight!.ArrivalTime,
                    Status = r.Status.ToString(),
                    CreatedAt = r.CreatedAt,
                    CancelledAt = r.CancelledAt
                })
                .FirstAsync();
        }
    }
}