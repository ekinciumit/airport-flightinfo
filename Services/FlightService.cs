using FlightInfo.Api.Data;
using FlightInfo.Api.Domain;
using FlightInfo.Api.DTOs;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Services
{
    public class FlightService : IFlightService
    {
        private readonly AppDbContext _context;
        private readonly ILogService _log;

        public FlightService(AppDbContext context, ILogService log)
        {
            _context = context;
            _log = log;
        }

        public async Task<IEnumerable<FlightDto>> GetFlightsAsync()
        {
            var flights = await _context.Flights
                .Where(f => f.Status != "Deleted")
                .Select(f => new FlightDto
                {
                    Id = f.Id,
                    FlightNumber = f.FlightNumber,
                    Origin = f.Origin,
                    Destination = f.Destination,
                    DepartureTime = f.DepartureTime,
                    ArrivalTime = f.ArrivalTime,
                    Status = f.Status
                })
                .ToListAsync();

            return flights;
        }

        public async Task<IEnumerable<FlightDto>> SearchFlightsAsync(FlightSearchCriteria criteria)
        {
            var query = _context.Flights
                .Where(f => f.Status != "Deleted");

            // Origin filtresi
            if (!string.IsNullOrEmpty(criteria.Origin))
            {
                query = query.Where(f => f.Origin == criteria.Origin);
            }

            // Destination filtresi
            if (!string.IsNullOrEmpty(criteria.Destination))
            {
                query = query.Where(f => f.Destination == criteria.Destination);
            }

            // Departure date filtresi
            if (criteria.DepartureDate.HasValue)
            {
                var startDate = criteria.DepartureDate.Value.Date;
                var endDate = startDate.AddDays(1);
                query = query.Where(f => f.DepartureTime >= startDate && f.DepartureTime < endDate);
            }

            // Status filtresi
            if (!string.IsNullOrEmpty(criteria.Status))
            {
                query = query.Where(f => f.Status == criteria.Status);
            }

            var flights = await query
                .Select(f => new FlightDto
                {
                    Id = f.Id,
                    FlightNumber = f.FlightNumber,
                    Origin = f.Origin,
                    Destination = f.Destination,
                    DepartureTime = f.DepartureTime,
                    ArrivalTime = f.ArrivalTime,
                    Status = f.Status
                })
                .OrderBy(f => f.DepartureTime)
                .ToListAsync();

            return flights;
        }

        public async Task<IEnumerable<object>> GetFlightsWithPricesAsync()
        {
            var flights = await _context.Flights
                .Where(f => f.Status != "Deleted")
                .Select(f => new
                {
                    Id = f.Id,
                    FlightNumber = f.FlightNumber,
                    Origin = f.Origin,
                    Destination = f.Destination,
                    DepartureTime = f.DepartureTime,
                    ArrivalTime = f.ArrivalTime,
                    Status = f.Status,
                    Prices = _context.FlightPrices
                        .Where(p => p.FlightId == f.Id)
                        .Select(p => new
                        {
                            Class = p.Class,
                            Price = p.Price,
                            Currency = p.Currency,
                            AvailableSeats = p.AvailableSeats
                        })
                        .ToList()
                })
                .OrderBy(f => f.DepartureTime)
                .ToListAsync();

            return flights;
        }

        public async Task<IEnumerable<object>> GetFlightPricesAsync(int flightId)
        {
            var flight = await _context.Flights.FindAsync(flightId);
            if (flight == null) throw new ArgumentException("U�u� bulunamad�.");

            var prices = await _context.FlightPrices
                .Where(p => p.FlightId == flightId)
                .Select(p => new
                {
                    Class = p.Class,
                    Price = p.Price,
                    Currency = p.Currency,
                    AvailableSeats = p.AvailableSeats
                })
                .ToListAsync();

            return prices;
        }

        public async Task<object> GetFlightStatusAsync(int flightId)
        {
            var flight = await _context.Flights.FindAsync(flightId);
            if (flight == null) throw new ArgumentException("U�u� bulunamad�.");

            var statusHistory = await _context.FlightStatusHistory
                .Where(s => s.FlightId == flightId)
                .OrderByDescending(s => s.ChangedAt)
                .Select(s => new
                {
                    Status = s.Status,
                    ChangedAt = s.ChangedAt,
                    Reason = s.Reason
                })
                .ToListAsync();

            return new
            {
                CurrentStatus = flight.Status,
                StatusHistory = statusHistory
            };
        }

        public async Task<FlightDto?> GetFlightAsync(int id)
        {
            var flight = await _context.Flights
                .Where(f => f.Id == id && f.Status != "Deleted")
                .Select(f => new FlightDto
                {
                    Id = f.Id,
                    FlightNumber = f.FlightNumber,
                    Origin = f.Origin,
                    Destination = f.Destination,
                    DepartureTime = f.DepartureTime,
                    ArrivalTime = f.ArrivalTime,
                    Status = f.Status
                })
                .FirstOrDefaultAsync();

            return flight;
        }

        public async Task<FlightDto> CreateFlightAsync(FlightDto flightDto)
        {
            var flight = new Flight
            {
                FlightNumber = flightDto.FlightNumber,
                Origin = flightDto.Origin,
                Destination = flightDto.Destination,
                DepartureTime = flightDto.DepartureTime,
                ArrivalTime = flightDto.ArrivalTime,
                Status = flightDto.Status
            };

            _context.Flights.Add(flight);
            await _context.SaveChangesAsync();

            flightDto.Id = flight.Id;
            return flightDto;
        }

        public async Task<FlightDto> UpdateFlightAsync(int id, FlightDto updatedFlight)
        {
            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) throw new ArgumentException("U�u� bulunamad�.");

            flight.FlightNumber = updatedFlight.FlightNumber;
            flight.Origin = updatedFlight.Origin;
            flight.Destination = updatedFlight.Destination;
            flight.DepartureTime = updatedFlight.DepartureTime;
            flight.ArrivalTime = updatedFlight.ArrivalTime;
            flight.Status = updatedFlight.Status;

            await _context.SaveChangesAsync();
            return updatedFlight;
        }

        public async Task<bool> DeleteFlightAsync(int id)
        {
            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return false;

            flight.Status = "Deleted";
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<FlightDto> RestoreFlightAsync(int id)
        {
            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) throw new ArgumentException("U�u� bulunamad�.");

            if (flight.Status != "Deleted")
                throw new InvalidOperationException("Bu u�u� zaten aktif.");

            flight.Status = "Scheduled";
            await _context.SaveChangesAsync();

            return new FlightDto
            {
                Id = flight.Id,
                FlightNumber = flight.FlightNumber,
                Origin = flight.Origin,
                Destination = flight.Destination,
                DepartureTime = flight.DepartureTime,
                ArrivalTime = flight.ArrivalTime,
                Status = flight.Status
            };
        }

        public async Task<IEnumerable<FlightDto>> GetDeletedFlightsAsync()
        {
            var flights = await _context.Flights
                .Where(f => f.Status == "Deleted")
                .Select(f => new FlightDto
                {
                    Id = f.Id,
                    FlightNumber = f.FlightNumber,
                    Origin = f.Origin,
                    Destination = f.Destination,
                    DepartureTime = f.DepartureTime,
                    ArrivalTime = f.ArrivalTime,
                    Status = f.Status
                })
                .ToListAsync();

            return flights;
        }
    }
}