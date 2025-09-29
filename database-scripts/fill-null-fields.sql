-- NULL alanları doldur
UPDATE Flights SET 
    availableSeats = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 150
        WHEN FlightNumber LIKE 'PC%' THEN 180
        WHEN FlightNumber LIKE 'LH%' THEN 200
        WHEN FlightNumber LIKE 'BA%' THEN 180
        WHEN FlightNumber LIKE 'EK%' THEN 300
        WHEN FlightNumber LIKE 'QR%' THEN 250
        ELSE 150
    END,
    price = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 450.00
        WHEN FlightNumber LIKE 'PC%' THEN 350.00
        WHEN FlightNumber LIKE 'LH%' THEN 550.00
        WHEN FlightNumber LIKE 'BA%' THEN 500.00
        WHEN FlightNumber LIKE 'EK%' THEN 650.00
        WHEN FlightNumber LIKE 'QR%' THEN 600.00
        ELSE 450.00
    END,
    duration = CASE 
        WHEN Origin = 'IST' AND Destination = 'LHR' THEN 210
        WHEN Origin = 'IST' AND Destination = 'CDG' THEN 195
        WHEN Origin = 'IST' AND Destination = 'FRA' THEN 150
        WHEN Origin = 'IST' AND Destination = 'AMS' THEN 150
        WHEN Origin = 'IST' AND Destination = 'MAD' THEN 210
        WHEN Origin = 'IST' AND Destination = 'FCO' THEN 150
        WHEN Origin = 'IST' AND Destination = 'VIE' THEN 150
        WHEN Origin = 'IST' AND Destination = 'ZUR' THEN 150
        WHEN Origin = 'IST' AND Destination = 'BER' THEN 150
        WHEN Origin = 'IST' AND Destination = 'MUC' THEN 150
        WHEN Origin = 'IST' AND Destination = 'DXB' THEN 270
        WHEN Origin = 'IST' AND Destination = 'AUH' THEN 240
        WHEN Origin = 'IST' AND Destination = 'DOH' THEN 210
        WHEN Origin = 'IST' AND Destination = 'NRT' THEN 720
        WHEN Origin = 'IST' AND Destination = 'ICN' THEN 600
        WHEN Origin = 'IST' AND Destination = 'SIN' THEN 540
        WHEN Origin = 'IST' AND Destination = 'BKK' THEN 480
        WHEN Origin = 'IST' AND Destination = 'JFK' THEN 600
        WHEN Origin = 'IST' AND Destination = 'LAX' THEN 720
        WHEN Origin = 'IST' AND Destination = 'ORD' THEN 660
        WHEN Origin = 'IST' AND Destination = 'MIA' THEN 720
        WHEN Origin = 'IST' AND Destination = 'SVO' THEN 150
        WHEN Origin = 'IST' AND Destination = 'KBP' THEN 120
        WHEN Origin = 'IST' AND Destination = 'MSQ' THEN 120
        WHEN Origin = 'IST' AND Destination = 'ESB' THEN 90
        WHEN Origin = 'IST' AND Destination = 'ADB' THEN 90
        WHEN Origin = 'IST' AND Destination = 'AYT' THEN 90
        WHEN Origin = 'IST' AND Destination = 'TZX' THEN 90
        WHEN Origin = 'IST' AND Destination = 'ADA' THEN 90
        WHEN Origin = 'IST' AND Destination = 'GZT' THEN 90
        WHEN Origin = 'IST' AND Destination = 'ASR' THEN 60
        WHEN Origin = 'IST' AND Destination = 'SZF' THEN 90
        WHEN Origin = 'IST' AND Destination = 'DIY' THEN 90
        WHEN Origin = 'IST' AND Destination = 'VAN' THEN 120
        WHEN Origin = 'IST' AND Destination = 'ERZ' THEN 120
        WHEN Origin = 'IST' AND Destination = 'MLX' THEN 90
        WHEN Origin = 'IST' AND Destination = 'SAW' THEN 30
        ELSE 150
    END,
    airline = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 'Turkish Airlines'
        WHEN FlightNumber LIKE 'PC%' THEN 'Pegasus Airlines'
        WHEN FlightNumber LIKE 'LH%' THEN 'Lufthansa'
        WHEN FlightNumber LIKE 'BA%' THEN 'British Airways'
        WHEN FlightNumber LIKE 'EK%' THEN 'Emirates'
        WHEN FlightNumber LIKE 'QR%' THEN 'Qatar Airways'
        WHEN FlightNumber LIKE 'AF%' THEN 'Air France'
        WHEN FlightNumber LIKE 'JL%' THEN 'Japan Airlines'
        ELSE 'Turkish Airlines'
    END,
    aircraft = CASE 
        WHEN FlightNumber LIKE 'TK%' THEN 'Boeing 737-800'
        WHEN FlightNumber LIKE 'PC%' THEN 'Airbus A320'
        WHEN FlightNumber LIKE 'LH%' THEN 'Airbus A320'
        WHEN FlightNumber LIKE 'BA%' THEN 'Boeing 737-800'
        WHEN FlightNumber LIKE 'EK%' THEN 'Boeing 777-300ER'
        WHEN FlightNumber LIKE 'QR%' THEN 'Boeing 787-8'
        WHEN FlightNumber LIKE 'AF%' THEN 'Airbus A320'
        WHEN FlightNumber LIKE 'JL%' THEN 'Boeing 787-9'
        ELSE 'Boeing 737-800'
    END,
    terminal = CASE 
        WHEN Origin = 'IST' THEN 'T1'
        WHEN Origin = 'SAW' THEN 'T1'
        WHEN Origin = 'LHR' THEN 'T5'
        WHEN Origin = 'CDG' THEN 'T2'
        WHEN Origin = 'FRA' THEN 'T1'
        WHEN Origin = 'AMS' THEN 'T1'
        WHEN Origin = 'MAD' THEN 'T4'
        WHEN Origin = 'FCO' THEN 'T3'
        WHEN Origin = 'VIE' THEN 'T3'
        WHEN Origin = 'ZUR' THEN 'T2'
        WHEN Origin = 'BER' THEN 'T1'
        WHEN Origin = 'MUC' THEN 'T2'
        WHEN Origin = 'DXB' THEN 'T3'
        WHEN Origin = 'AUH' THEN 'T3'
        WHEN Origin = 'DOH' THEN 'T1'
        WHEN Origin = 'NRT' THEN 'T1'
        WHEN Origin = 'ICN' THEN 'T2'
        WHEN Origin = 'SIN' THEN 'T3'
        WHEN Origin = 'BKK' THEN 'T1'
        WHEN Origin = 'JFK' THEN 'T4'
        WHEN Origin = 'LAX' THEN 'TBIT'
        WHEN Origin = 'ORD' THEN 'T5'
        WHEN Origin = 'MIA' THEN 'T1'
        WHEN Origin = 'SVO' THEN 'T1'
        WHEN Origin = 'KBP' THEN 'T1'
        WHEN Origin = 'MSQ' THEN 'T1'
        WHEN Origin = 'ESB' THEN 'T1'
        WHEN Origin = 'ADB' THEN 'T1'
        WHEN Origin = 'AYT' THEN 'T1'
        WHEN Origin = 'TZX' THEN 'T1'
        WHEN Origin = 'ADA' THEN 'T1'
        WHEN Origin = 'GZT' THEN 'T1'
        WHEN Origin = 'ASR' THEN 'T1'
        WHEN Origin = 'SZF' THEN 'T1'
        WHEN Origin = 'DIY' THEN 'T1'
        WHEN Origin = 'VAN' THEN 'T1'
        WHEN Origin = 'ERZ' THEN 'T1'
        WHEN Origin = 'MLX' THEN 'T1'
        ELSE 'T1'
    END,
    gate = CASE 
        WHEN Origin = 'IST' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'SAW' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'LHR' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'CDG' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'FRA' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'AMS' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'MAD' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'FCO' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'VIE' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ZUR' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'BER' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'MUC' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'DXB' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 30) + 1 AS NVARCHAR(2))
        WHEN Origin = 'AUH' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'DOH' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'NRT' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 30) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ICN' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'SIN' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'BKK' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'JFK' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 30) + 1 AS NVARCHAR(2))
        WHEN Origin = 'LAX' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 30) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ORD' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'MIA' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 25) + 1 AS NVARCHAR(2))
        WHEN Origin = 'SVO' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 20) + 1 AS NVARCHAR(2))
        WHEN Origin = 'KBP' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'MSQ' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 15) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ESB' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ADB' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'AYT' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'TZX' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ADA' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'GZT' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ASR' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'SZF' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'DIY' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'VAN' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'ERZ' THEN 'A' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        WHEN Origin = 'MLX' THEN 'B' + CAST((ABS(CHECKSUM(NEWID())) % 10) + 1 AS NVARCHAR(2))
        ELSE 'A1'
    END
WHERE Status != 'Deleted';
