-- Önce Flight tablosuna yeni kolonları ekle
ALTER TABLE Flights ADD availableSeats INT DEFAULT 150;
ALTER TABLE Flights ADD price DECIMAL(10,2) DEFAULT 0.00;
ALTER TABLE Flights ADD duration INT DEFAULT 0;
ALTER TABLE Flights ADD airline NVARCHAR(100) DEFAULT 'Turkish Airlines';
ALTER TABLE Flights ADD aircraft NVARCHAR(100) DEFAULT 'Boeing 737';
ALTER TABLE Flights ADD terminal NVARCHAR(10) DEFAULT 'T1';
ALTER TABLE Flights ADD gate NVARCHAR(10) DEFAULT 'A1';
