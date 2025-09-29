-- Flight tablosuna eksik alanları ekle
ALTER TABLE Flights ADD totalSeats INT DEFAULT 150;
ALTER TABLE Flights ADD seatClass NVARCHAR(50) DEFAULT 'Economy';
ALTER TABLE Flights ADD currency NVARCHAR(10) DEFAULT 'TRY';
ALTER TABLE Flights ADD baggage NVARCHAR(20) DEFAULT '23kg';

-- Mevcut verileri güncelle
UPDATE Flights SET 
    totalSeats = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 150
        WHEN FlightNumber LIKE 'PC%' THEN 180
        WHEN FlightNumber LIKE 'LH%' THEN 200
        WHEN FlightNumber LIKE 'BA%' THEN 180
        WHEN FlightNumber LIKE 'EK%' THEN 300
        WHEN FlightNumber LIKE 'QR%' THEN 250
        ELSE 150
    END,
    seatClass = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 'Economy'
        WHEN FlightNumber LIKE 'PC%' THEN 'Economy'
        WHEN FlightNumber LIKE 'LH%' THEN 'Economy'
        WHEN FlightNumber LIKE 'BA%' THEN 'Economy'
        WHEN FlightNumber LIKE 'EK%' THEN 'Economy'
        WHEN FlightNumber LIKE 'QR%' THEN 'Economy'
        ELSE 'Economy'
    END,
    currency = CASE 
        WHEN Origin = 'IST' OR Origin = 'SAW' OR Origin = 'ESB' OR Origin = 'ADB' OR Origin = 'AYT' OR Origin = 'TZX' OR Origin = 'ADA' OR Origin = 'GZT' OR Origin = 'ASR' OR Origin = 'SZF' OR Origin = 'DIY' OR Origin = 'VAN' OR Origin = 'ERZ' OR Origin = 'MLX' THEN 'TRY'
        WHEN Origin = 'LHR' OR Origin = 'LGW' OR Origin = 'MAN' OR Origin = 'BHX' THEN 'GBP'
        WHEN Origin = 'CDG' OR Origin = 'ORY' OR Origin = 'LYS' OR Origin = 'MRS' THEN 'EUR'
        WHEN Origin = 'FRA' OR Origin = 'MUC' OR Origin = 'HAM' OR Origin = 'DUS' OR Origin = 'STR' OR Origin = 'BER' THEN 'EUR'
        WHEN Origin = 'AMS' THEN 'EUR'
        WHEN Origin = 'MAD' OR Origin = 'BCN' OR Origin = 'AGP' THEN 'EUR'
        WHEN Origin = 'FCO' OR Origin = 'MXP' OR Origin = 'NAP' OR Origin = 'VCE' THEN 'EUR'
        WHEN Origin = 'VIE' OR Origin = 'ZUR' THEN 'EUR'
        WHEN Origin = 'DXB' THEN 'AED'
        WHEN Origin = 'AUH' THEN 'AED'
        WHEN Origin = 'DOH' THEN 'QAR'
        WHEN Origin = 'NRT' OR Origin = 'KIX' THEN 'JPY'
        WHEN Origin = 'ICN' THEN 'KRW'
        WHEN Origin = 'SIN' THEN 'SGD'
        WHEN Origin = 'BKK' THEN 'THB'
        WHEN Origin = 'JFK' OR Origin = 'LAX' OR Origin = 'ORD' OR Origin = 'MIA' THEN 'USD'
        WHEN Origin = 'SVO' OR Origin = 'KBP' OR Origin = 'MSQ' THEN 'RUB'
        ELSE 'TRY'
    END,
    baggage = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN '23kg'
        WHEN FlightNumber LIKE 'PC%' THEN '20kg'
        WHEN FlightNumber LIKE 'LH%' THEN '23kg'
        WHEN FlightNumber LIKE 'BA%' THEN '23kg'
        WHEN FlightNumber LIKE 'EK%' THEN '30kg'
        WHEN FlightNumber LIKE 'QR%' THEN '25kg'
        ELSE '23kg'
    END
WHERE Status != 'Deleted';
