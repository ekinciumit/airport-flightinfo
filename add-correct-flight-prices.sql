-- Doğru ID'lerle uçuş fiyatları ekle
INSERT INTO FlightPrices (FlightId, Class, Price, Currency, AvailableSeats) VALUES
-- TK1 (ID: 389) - IST to LHR
(389, 'Economy', 2500.00, 'TRY', 150),
(389, 'Business', 7500.00, 'TRY', 20),
(389, 'First', 15000.00, 'TRY', 8),

-- TK2 (ID: 390) - IST to CDG
(390, 'Economy', 2200.00, 'TRY', 160),
(390, 'Business', 6800.00, 'TRY', 25),
(390, 'First', 13500.00, 'TRY', 6),

-- TK3 (ID: 391) - IST to FRA
(391, 'Economy', 2400.00, 'TRY', 155),
(391, 'Business', 7200.00, 'TRY', 22),
(391, 'First', 14200.00, 'TRY', 7),

-- TK4 (ID: 392) - IST to AMS
(392, 'Economy', 2300.00, 'TRY', 158),
(392, 'Business', 7000.00, 'TRY', 24),
(392, 'First', 13800.00, 'TRY', 6),

-- TK5 (ID: 393) - IST to FCO
(393, 'Economy', 2100.00, 'TRY', 165),
(393, 'Business', 6500.00, 'TRY', 28),
(393, 'First', 12800.00, 'TRY', 8),

-- TK6 (ID: 394) - IST to MAD
(394, 'Economy', 2600.00, 'TRY', 145),
(394, 'Business', 7800.00, 'TRY', 18),
(394, 'First', 15200.00, 'TRY', 5),

-- TK7 (ID: 395) - IST to MUC
(395, 'Economy', 2450.00, 'TRY', 152),
(395, 'Business', 7350.00, 'TRY', 21),
(395, 'First', 14700.00, 'TRY', 7),

-- TK8 (ID: 396) - IST to BCN
(396, 'Economy', 2350.00, 'TRY', 156),
(396, 'Business', 7050.00, 'TRY', 23),
(396, 'First', 14100.00, 'TRY', 6),

-- TK9 (ID: 397) - IST to BER
(397, 'Economy', 2420.00, 'TRY', 153),
(397, 'Business', 7260.00, 'TRY', 20),
(397, 'First', 14520.00, 'TRY', 7),

-- TK10 (ID: 398) - IST to MXP
(398, 'Economy', 2180.00, 'TRY', 162),
(398, 'Business', 6540.00, 'TRY', 26),
(398, 'First', 13080.00, 'TRY', 8),

-- TK11 (ID: 399) - IST to JFK (Uzun mesafe)
(399, 'Economy', 8500.00, 'TRY', 120),
(399, 'Business', 25000.00, 'TRY', 15),
(399, 'First', 50000.00, 'TRY', 4),

-- TK12 (ID: 400) - IST to LAX (Uzun mesafe)
(400, 'Economy', 9500.00, 'TRY', 110),
(400, 'Business', 28000.00, 'TRY', 12),
(400, 'First', 55000.00, 'TRY', 3),

-- TK13 (ID: 401) - IST to ORD (Uzun mesafe)
(401, 'Economy', 8800.00, 'TRY', 115),
(401, 'Business', 26000.00, 'TRY', 14),
(401, 'First', 52000.00, 'TRY', 4),

-- TK14 (ID: 402) - IST to MIA (Uzun mesafe)
(402, 'Economy', 9200.00, 'TRY', 112),
(402, 'Business', 27000.00, 'TRY', 13),
(402, 'First', 54000.00, 'TRY', 3),

-- TK15 (ID: 403) - IST to LAS (Uzun mesafe)
(403, 'Economy', 9800.00, 'TRY', 108),
(403, 'Business', 29000.00, 'TRY', 11),
(403, 'First', 58000.00, 'TRY', 3),

-- TK16 (ID: 404) - IST to NRT (Asya)
(404, 'Economy', 7800.00, 'TRY', 125),
(404, 'Business', 23000.00, 'TRY', 16),
(404, 'First', 46000.00, 'TRY', 4),

-- TK17 (ID: 405) - IST to ICN (Asya)
(405, 'Economy', 7200.00, 'TRY', 130),
(405, 'Business', 21000.00, 'TRY', 18),
(405, 'First', 42000.00, 'TRY', 5),

-- TK18 (ID: 406) - IST to SIN (Asya)
(406, 'Economy', 6800.00, 'TRY', 135),
(406, 'Business', 20000.00, 'TRY', 20),
(406, 'First', 40000.00, 'TRY', 6),

-- TK19 (ID: 407) - IST to DXB (Orta Doğu)
(407, 'Economy', 1800.00, 'TRY', 170),
(407, 'Business', 5400.00, 'TRY', 30),
(407, 'First', 10800.00, 'TRY', 10),

-- TK20 (ID: 408) - IST to AUH (Orta Doğu)
(408, 'Economy', 1850.00, 'TRY', 168),
(408, 'Business', 5550.00, 'TRY', 29),
(408, 'First', 11100.00, 'TRY', 9);
