-- Sadece kolonları ekle
ALTER TABLE Flights ADD totalSeats INT DEFAULT 150;
ALTER TABLE Flights ADD seatClass NVARCHAR(50) DEFAULT 'Economy';
ALTER TABLE Flights ADD currency NVARCHAR(10) DEFAULT 'TRY';
ALTER TABLE Flights ADD baggage NVARCHAR(20) DEFAULT '23kg';
