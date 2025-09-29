using System.Security.Claims;
using FlightInfo.Api.Data;
using FlightInfo.Api.Domain;
using FlightInfo.Api.DTOs;
using FlightInfo.Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize] // giriş yapmış kullanıcılar
    public class FlightController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ILogService _log;

        public FlightController(AppDbContext context, ILogService log)
        {
            _context = context;
            _log = log;
        }

        // JWT'den kullanıcı Id'sini al
        private int? GetCurrentUserId()
        {
            var idStr = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (int.TryParse(idStr, out var id)) return id;
            return null;
        }

        // GET: api/flight → sadece aktif uçuşları döndür
        [HttpGet]
        [AllowAnonymous] // giriş yapmamış kullanıcılar da görebilir
        public async Task<IActionResult> GetFlights()
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

            return Ok(flights);
        }

        // GET: api/flight/search → uçuş arama
        [HttpGet("search")]
        [AllowAnonymous]
        public async Task<IActionResult> SearchFlights(
            [FromQuery] string? origin,
            [FromQuery] string? destination,
            [FromQuery] DateTime? departureDate,
            [FromQuery] DateTime? returnDate,
            [FromQuery] string? classType = "Economy",
            [FromQuery] int? passengers = 1,
            [FromQuery] string? status = "Scheduled")
        {
            var query = _context.Flights
                .Where(f => f.Status != "Deleted");

            // Origin filtresi
            if (!string.IsNullOrEmpty(origin))
            {
                query = query.Where(f => f.Origin == origin);
            }

            // Destination filtresi
            if (!string.IsNullOrEmpty(destination))
            {
                query = query.Where(f => f.Destination == destination);
            }

            // Departure date filtresi
            if (departureDate.HasValue)
            {
                var startDate = departureDate.Value.Date;
                var endDate = startDate.AddDays(1);
                query = query.Where(f => f.DepartureTime >= startDate && f.DepartureTime < endDate);
            }

            // Status filtresi
            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(f => f.Status == status);
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

            return Ok(flights);
        }

        // GET: api/flight/with-prices → uçuşları fiyatlarla birlikte getir
        [HttpGet("with-prices")]
        [AllowAnonymous]
        public async Task<IActionResult> GetFlightsWithPrices()
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

            return Ok(flights);
        }

        // GET: api/flight/{id}/prices → uçuş fiyatları
        [HttpGet("{id}/prices")]
        [AllowAnonymous]
        public async Task<IActionResult> GetFlightPrices(int id)
        {
            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return NotFound();

            var prices = await _context.FlightPrices
                .Where(p => p.FlightId == id)
                .Select(p => new
                {
                    Class = p.Class,
                    Price = p.Price,
                    Currency = p.Currency,
                    AvailableSeats = p.AvailableSeats
                })
                .ToListAsync();

            return Ok(prices);
        }

        // GET: api/flight/{id}/status → uçuş durumu ve geçmişi
        [HttpGet("{id}/status")]
        [AllowAnonymous]
        public async Task<IActionResult> GetFlightStatus(int id)
        {
            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return NotFound();

            var statusHistory = await _context.FlightStatusHistory
                .Where(s => s.FlightId == id)
                .OrderByDescending(s => s.ChangedAt)
                .Select(s => new
                {
                    Status = s.Status,
                    ChangedAt = s.ChangedAt,
                    Reason = s.Reason
                })
                .ToListAsync();

            return Ok(new
            {
                CurrentStatus = flight.Status,
                StatusHistory = statusHistory
            });
        }

        // GET: api/flight/deleted → silinen uçuşlar (sadece Admin)
        [HttpGet("deleted")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetDeletedFlights()
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

            return Ok(flights);
        }

        // GET: api/flight/5
        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetFlight(int id)
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

            if (flight == null) return NotFound();
            return Ok(flight);
        }

        // POST: api/flight
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateFlight(FlightDto flightDto)
        {
            var adminId = GetCurrentUserId();
            if (adminId is null) return Unauthorized();

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

            await _log.LogAsync("Flight Created", adminId.Value, flight.Id);

            flightDto.Id = flight.Id;
            return CreatedAtAction(nameof(GetFlight), new { id = flight.Id }, flightDto);
        }

        // PUT: api/flight/5
        [HttpPut("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateFlight(int id, FlightDto updatedFlight)
        {
            var adminId = GetCurrentUserId();
            if (adminId is null) return Unauthorized();

            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return NotFound();

            flight.FlightNumber = updatedFlight.FlightNumber;
            flight.Origin = updatedFlight.Origin;
            flight.Destination = updatedFlight.Destination;
            flight.DepartureTime = updatedFlight.DepartureTime;
            flight.ArrivalTime = updatedFlight.ArrivalTime;
            flight.Status = updatedFlight.Status;

            await _context.SaveChangesAsync();
            await _log.LogAsync("Flight Updated", adminId.Value, id);

            return NoContent();
        }

        // DELETE: api/flight/5 → soft delete
        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteFlight(int id)
        {
            var adminId = GetCurrentUserId();
            if (adminId is null) return Unauthorized();

            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return NotFound();

            flight.Status = "Deleted";
            await _context.SaveChangesAsync();
            await _log.LogAsync("Flight Deleted", adminId.Value, flight.Id);

            return NoContent();
        }

        // PUT: api/flight/restore/5 → soft delete geri al
        [HttpPut("restore/{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RestoreFlight(int id)
        {
            var adminId = GetCurrentUserId();
            if (adminId is null) return Unauthorized();

            var flight = await _context.Flights.FindAsync(id);
            if (flight == null) return NotFound();

            if (flight.Status != "Deleted")
                return BadRequest("Bu uçuş zaten aktif.");

            flight.Status = "Scheduled"; // restore default status
            await _context.SaveChangesAsync();
            await _log.LogAsync("Flight Restored", adminId.Value, flight.Id);

            return Ok(new { message = "Uçuş başarıyla geri getirildi." });
        }
    }
}
