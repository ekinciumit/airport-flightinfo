-- Rezervasyon verilerini kontrol et
SELECT 
    r.Id,
    r.UserId,
    r.FlightId,
    r.Status,
    r.CreatedAt,
    r.CancelledAt,
    f.FlightNumber,
    f.Origin,
    f.Destination,
    f.DepartureTime,
    f.ArrivalTime,
    f.Status as FlightStatus
FROM Reservations r
INNER JOIN Flights f ON r.FlightId = f.Id
ORDER BY r.CreatedAt DESC;

-- Status enum değerlerini kontrol et
SELECT DISTINCT Status FROM Reservations;

-- Uçuş durumlarını kontrol et
SELECT DISTINCT Status FROM Flights;
