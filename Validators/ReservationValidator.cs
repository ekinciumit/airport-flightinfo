using FlightInfo.Api.Data;
using FlightInfo.Api.Domain;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Validators
{
    public static class ReservationValidator
    {
        public static async Task<List<string>> ValidateReservationAsync(AppDbContext context, int userId, int flightId)
        {
            var errors = new List<string>();

            // Uçuş var mı kontrol et
            var flight = await context.Flights.FindAsync(flightId);
            if (flight == null)
            {
                errors.Add("Uçuş bulunamadı.");
                return errors;
            }

            // Uçuş durumu uygun mu
            if (flight.Status == "Deleted" || flight.Status == "Cancelled")
                errors.Add("Bu uçuş rezervasyona uygun değil.");

            // Kullanıcı zaten rezervasyon yapmış mı
            var existingReservation = await context.Reservations
                .AnyAsync(r => r.UserId == userId && r.FlightId == flightId && r.Status == ReservationStatus.Active);

            if (existingReservation)
                errors.Add("Bu uçuş için zaten aktif bir rezervasyonunuz var.");

            return errors;
        }
    }
}
