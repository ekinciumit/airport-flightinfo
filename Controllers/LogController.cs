using FlightInfo.Api.Data;
using FlightInfo.Api.Domain;
using FlightInfo.Api.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogController : ControllerBase
    {
        private readonly AppDbContext _context;

        public LogController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/log
        [HttpGet]
        public async Task<IActionResult> GetLogs()
        {
            var logs = await _context.Logs
                .Include(l => l.User)
                .Include(l => l.Flight)
                .Select(l => new LogDto
                {
                    Id = l.Id,
                    Action = l.Action,
                    Timestamp = l.Timestamp,
                    // Username yerine Email veya FullName kullanalım
                    UserEmail = l.User != null ? l.User.Email : null,
                    UserFullName = l.User != null ? l.User.FullName : null,
                    FlightNumber = l.Flight != null ? l.Flight.FlightNumber : null
                })
                .ToListAsync();

            return Ok(logs);
        }

        // POST: api/log
        [HttpPost]
        public async Task<IActionResult> CreateLog(Log log)
        {
            log.Timestamp = DateTime.UtcNow;

            _context.Logs.Add(log);
            await _context.SaveChangesAsync();

            var user = await _context.Users.FindAsync(log.UserId);
            var flight = await _context.Flights.FindAsync(log.FlightId);

            var createdLog = new LogDto
            {
                Id = log.Id,
                Action = log.Action,
                Timestamp = log.Timestamp,
                UserEmail = user?.Email,
                UserFullName = user?.FullName,
                FlightNumber = flight?.FlightNumber
            };

            return CreatedAtAction(nameof(GetLogs), new { id = log.Id }, createdLog);
        }

        // DELETE: api/log/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteLog(int id)
        {
            var log = await _context.Logs.FindAsync(id);
            if (log == null)
                return NotFound();

            // Soft delete → Action alanını güncelle
            log.Action = "Deleted";
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}