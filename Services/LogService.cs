using FlightInfo.Api.Data;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Services
{
    public class LogService : ILogService
    {
        private readonly AppDbContext _db;

        public LogService(AppDbContext db)
        {
            _db = db;
        }

        public async Task LogAsync(string action, int? userId, int? flightId = null)
        {
            // sadece User kontrol et (Flight kontrolünü kaldır)
            var userExists = userId.HasValue && await _db.Users.AnyAsync(u => u.Id == userId.Value);

            var log = new Log
            {
                UserId = userExists ? userId : null,
                FlightId = flightId,   // uçuş silinmiş olabilir → null olabilir
                Action = action,
                Timestamp = DateTime.UtcNow
            };

            _db.Logs.Add(log);
            await _db.SaveChangesAsync();
        }

    }
}
