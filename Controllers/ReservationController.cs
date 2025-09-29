using System.Security.Claims;
using FlightInfo.Api.DTOs;
using FlightInfo.Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FlightInfo.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize] // login gerekli
    public class ReservationController : ControllerBase
    {
        private readonly IReservationService _reservationService;

        public ReservationController(IReservationService reservationService)
        {
            _reservationService = reservationService;
        }

        private int? GetCurrentUserId()
        {
            var idStr = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (int.TryParse(idStr, out var id)) return id;
            return null;
        }

        public record CreateReservationRequest(int FlightId);

        // POST: api/Reservation → Bilet satın al (sadece User rolü)
        [HttpPost]
        [Authorize(Roles = "User")]
        public async Task<IActionResult> Create([FromBody] CreateReservationRequest req)
        {
            var userId = GetCurrentUserId();
            if (userId is null) return Unauthorized();

            try
            {
                var reservation = await _reservationService.CreateReservationAsync(userId.Value, req.FlightId);
                return CreatedAtAction(nameof(GetReservation), new { id = reservation.Id }, reservation);
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(500, "Bir hata oluştu.");
            }
        }

        // GET: api/Reservation/{id} → Tek rezervasyon (sadece User rolü)
        [HttpGet("{id}")]
        [Authorize(Roles = "User")]
        public async Task<IActionResult> GetReservation(int id)
        {
            var userId = GetCurrentUserId();
            if (userId is null) return Unauthorized();

            var reservation = await _reservationService.GetReservationAsync(id, userId.Value);
            if (reservation is null) return NotFound();
            return Ok(reservation);
        }

        // GET: api/Reservation → Kullanıcının rezervasyonları (sadece User rolü)
        [HttpGet]
        [Authorize(Roles = "User")]
        public async Task<IActionResult> GetMine([FromQuery] string? status = null)
        {
            var userId = GetCurrentUserId();
            if (userId is null) return Unauthorized();

            var reservations = await _reservationService.GetUserReservationsAsync(userId.Value, status);
            return Ok(reservations);
        }

        // DELETE: api/Reservation/{id} → İptal (sadece User rolü)
        [HttpDelete("{id}")]
        [Authorize(Roles = "User")]
        public async Task<IActionResult> Cancel(int id)
        {
            var userId = GetCurrentUserId();
            if (userId is null) return Unauthorized();

            try
            {
                var success = await _reservationService.CancelReservationAsync(id, userId.Value);
                if (!success) return NotFound();
                return NoContent();
            }
            catch (UnauthorizedAccessException)
            {
                return Forbid();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT: api/Reservation/restore/{id} → İptal edilen rezervasyonu geri al
        [HttpPut("restore/{id}")]
        [Authorize(Roles = "User")]
        public async Task<IActionResult> RestoreReservation(int id)
        {
            var userId = GetCurrentUserId();
            if (userId is null) return Unauthorized();

            try
            {
                var reservation = await _reservationService.RestoreReservationAsync(id, userId.Value);
                return Ok(reservation);
            }
            catch (ArgumentException)
            {
                return NotFound();
            }
            catch (UnauthorizedAccessException)
            {
                return Forbid();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // ADMIN: Tüm rezervasyonları listele
        [HttpGet("all")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAll([FromQuery] string? status = null)
        {
            var reservations = await _reservationService.GetAllReservationsAsync(status);
            return Ok(reservations);
        }
    }
}
