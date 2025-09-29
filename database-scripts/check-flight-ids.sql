-- Mevcut uçuş ID'lerini kontrol et
SELECT TOP 20 Id, FlightNumber, Origin, Destination, Status 
FROM Flights 
ORDER BY Id;
