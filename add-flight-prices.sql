-- Uçuşlara fiyat bilgileri ekle
INSERT INTO FlightPrices (FlightId, Class, Price, Currency, AvailableSeats) VALUES
-- TK1 - IST to LHR
(1, 'Economy', 2500.00, 'TRY', 150),
(1, 'Business', 7500.00, 'TRY', 20),
(1, 'First', 15000.00, 'TRY', 8),

-- TK2 - IST to CDG
(2, 'Economy', 2200.00, 'TRY', 160),
(2, 'Business', 6800.00, 'TRY', 25),
(2, 'First', 13500.00, 'TRY', 6),

-- TK3 - IST to FRA
(3, 'Economy', 2400.00, 'TRY', 155),
(3, 'Business', 7200.00, 'TRY', 22),
(3, 'First', 14200.00, 'TRY', 7),

-- TK4 - IST to AMS
(4, 'Economy', 2300.00, 'TRY', 158),
(4, 'Business', 7000.00, 'TRY', 24),
(4, 'First', 13800.00, 'TRY', 6),

-- TK5 - IST to FCO
(5, 'Economy', 2100.00, 'TRY', 165),
(5, 'Business', 6500.00, 'TRY', 28),
(5, 'First', 12800.00, 'TRY', 8),

-- TK6 - IST to MAD
(6, 'Economy', 2600.00, 'TRY', 145),
(6, 'Business', 7800.00, 'TRY', 18),
(6, 'First', 15200.00, 'TRY', 5),

-- TK7 - IST to MUC
(7, 'Economy', 2450.00, 'TRY', 152),
(7, 'Business', 7350.00, 'TRY', 21),
(7, 'First', 14700.00, 'TRY', 7),

-- TK8 - IST to BCN
(8, 'Economy', 2350.00, 'TRY', 156),
(8, 'Business', 7050.00, 'TRY', 23),
(8, 'First', 14100.00, 'TRY', 6),

-- TK9 - IST to BER
(9, 'Economy', 2420.00, 'TRY', 153),
(9, 'Business', 7260.00, 'TRY', 20),
(9, 'First', 14520.00, 'TRY', 7),

-- TK10 - IST to MXP
(10, 'Economy', 2180.00, 'TRY', 162),
(10, 'Business', 6540.00, 'TRY', 26),
(10, 'First', 13080.00, 'TRY', 8),

-- TK11 - IST to JFK (Uzun mesafe)
(11, 'Economy', 8500.00, 'TRY', 120),
(11, 'Business', 25000.00, 'TRY', 15),
(11, 'First', 50000.00, 'TRY', 4),

-- TK12 - IST to LAX (Uzun mesafe)
(12, 'Economy', 9500.00, 'TRY', 110),
(12, 'Business', 28000.00, 'TRY', 12),
(12, 'First', 55000.00, 'TRY', 3),

-- TK13 - IST to ORD (Uzun mesafe)
(13, 'Economy', 8800.00, 'TRY', 115),
(13, 'Business', 26000.00, 'TRY', 14),
(13, 'First', 52000.00, 'TRY', 4),

-- TK14 - IST to MIA (Uzun mesafe)
(14, 'Economy', 9200.00, 'TRY', 112),
(14, 'Business', 27000.00, 'TRY', 13),
(14, 'First', 54000.00, 'TRY', 3),

-- TK15 - IST to LAS (Uzun mesafe)
(15, 'Economy', 9800.00, 'TRY', 108),
(15, 'Business', 29000.00, 'TRY', 11),
(15, 'First', 58000.00, 'TRY', 3),

-- TK16 - IST to NRT (Asya)
(16, 'Economy', 7800.00, 'TRY', 125),
(16, 'Business', 23000.00, 'TRY', 16),
(16, 'First', 46000.00, 'TRY', 4),

-- TK17 - IST to ICN (Asya)
(17, 'Economy', 7200.00, 'TRY', 130),
(17, 'Business', 21000.00, 'TRY', 18),
(17, 'First', 42000.00, 'TRY', 5),

-- TK18 - IST to SIN (Asya)
(18, 'Economy', 6800.00, 'TRY', 135),
(18, 'Business', 20000.00, 'TRY', 20),
(18, 'First', 40000.00, 'TRY', 6),

-- TK19 - IST to DXB (Orta Doğu)
(19, 'Economy', 1800.00, 'TRY', 170),
(19, 'Business', 5400.00, 'TRY', 30),
(19, 'First', 10800.00, 'TRY', 10),

-- TK20 - IST to AUH (Orta Doğu)
(20, 'Economy', 1850.00, 'TRY', 168),
(20, 'Business', 5550.00, 'TRY', 29),
(20, 'First', 11100.00, 'TRY', 9),

-- LH21 - FRA to IST
(21, 'Economy', 2200.00, 'EUR', 155),
(21, 'Business', 6500.00, 'EUR', 25),
(21, 'First', 13000.00, 'EUR', 8),

-- AF22 - CDG to IST
(22, 'Economy', 2100.00, 'EUR', 160),
(22, 'Business', 6200.00, 'EUR', 28),
(22, 'First', 12400.00, 'EUR', 9),

-- BA23 - LHR to IST
(23, 'Economy', 2300.00, 'GBP', 150),
(23, 'Business', 6800.00, 'GBP', 22),
(23, 'First', 13600.00, 'GBP', 7),

-- KL24 - AMS to IST
(24, 'Economy', 2150.00, 'EUR', 158),
(24, 'Business', 6350.00, 'EUR', 26),
(24, 'First', 12700.00, 'EUR', 8),

-- AZ25 - FCO to IST
(25, 'Economy', 2000.00, 'EUR', 165),
(25, 'Business', 5900.00, 'EUR', 30),
(25, 'First', 11800.00, 'EUR', 10),

-- LH26 - FRA to LHR
(26, 'Economy', 450.00, 'EUR', 180),
(26, 'Business', 1350.00, 'EUR', 40),
(26, 'First', 2700.00, 'EUR', 12),

-- AF27 - CDG to BCN
(27, 'Economy', 380.00, 'EUR', 185),
(27, 'Business', 1140.00, 'EUR', 45),
(27, 'First', 2280.00, 'EUR', 15),

-- BA28 - LHR to MAD
(28, 'Economy', 420.00, 'GBP', 175),
(28, 'Business', 1260.00, 'GBP', 42),
(28, 'First', 2520.00, 'GBP', 13),

-- KL29 - AMS to FCO
(29, 'Economy', 400.00, 'EUR', 178),
(29, 'Business', 1200.00, 'EUR', 43),
(29, 'First', 2400.00, 'EUR', 14),

-- AZ30 - MXP to CDG
(30, 'Economy', 350.00, 'EUR', 190),
(30, 'Business', 1050.00, 'EUR', 48),
(30, 'First', 2100.00, 'EUR', 18),

-- AA31 - JFK to LAX (Amerika içi)
(31, 'Economy', 450.00, 'USD', 200),
(31, 'Business', 1350.00, 'USD', 50),
(31, 'First', 2700.00, 'USD', 20),

-- UA32 - ORD to MIA (Amerika içi)
(32, 'Economy', 380.00, 'USD', 205),
(32, 'Business', 1140.00, 'USD', 55),
(32, 'First', 2280.00, 'USD', 25),

-- DL33 - LAX to LAS (Amerika içi)
(33, 'Economy', 250.00, 'USD', 220),
(33, 'Business', 750.00, 'USD', 60),
(33, 'First', 1500.00, 'USD', 30),

-- AA34 - MIA to ORD (Amerika içi)
(34, 'Economy', 400.00, 'USD', 195),
(34, 'Business', 1200.00, 'USD', 52),
(34, 'First', 2400.00, 'USD', 22),

-- UA35 - LAS to JFK (Amerika içi)
(35, 'Economy', 480.00, 'USD', 185),
(35, 'Business', 1440.00, 'USD', 48),
(35, 'First', 2880.00, 'USD', 18),

-- AC36 - YYZ to JFK (Kanada-Amerika)
(36, 'Economy', 320.00, 'CAD', 175),
(36, 'Business', 960.00, 'CAD', 45),
(36, 'First', 1920.00, 'CAD', 15),

-- AC37 - YVR to LAX (Kanada-Amerika)
(37, 'Economy', 280.00, 'CAD', 180),
(37, 'Business', 840.00, 'CAD', 48),
(37, 'First', 1680.00, 'CAD', 18),

-- AC38 - YUL to ORD (Kanada-Amerika)
(38, 'Economy', 300.00, 'CAD', 178),
(38, 'Business', 900.00, 'CAD', 46),
(38, 'First', 1800.00, 'CAD', 16),

-- NH39 - NRT to ICN (Asya içi)
(39, 'Economy', 450.00, 'JPY', 170),
(39, 'Business', 1350.00, 'JPY', 40),
(39, 'First', 2700.00, 'JPY', 15),

-- KE40 - ICN to SIN (Asya içi)
(40, 'Economy', 380.00, 'KRW', 175),
(40, 'Business', 1140.00, 'KRW', 42),
(40, 'First', 2280.00, 'KRW', 18),

-- SQ41 - SIN to NRT (Asya içi)
(41, 'Economy', 420.00, 'SGD', 168),
(41, 'Business', 1260.00, 'SGD', 44),
(41, 'First', 2520.00, 'SGD', 16),

-- NH42 - HND to KIX (Japonya içi)
(42, 'Economy', 180.00, 'JPY', 200),
(42, 'Business', 540.00, 'JPY', 60),
(42, 'First', 1080.00, 'JPY', 30),

-- KE43 - ICN to DXB (Asya-Orta Doğu)
(43, 'Economy', 680.00, 'KRW', 155),
(43, 'Business', 2040.00, 'KRW', 35),
(43, 'First', 4080.00, 'KRW', 12),

-- EK44 - DXB to IST (Orta Doğu-Türkiye)
(44, 'Economy', 1200.00, 'AED', 160),
(44, 'Business', 3600.00, 'AED', 30),
(44, 'First', 7200.00, 'AED', 10),

-- EY45 - AUH to CDG (Orta Doğu-Avrupa)
(45, 'Economy', 1800.00, 'AED', 145),
(45, 'Business', 5400.00, 'AED', 25),
(45, 'First', 10800.00, 'AED', 8),

-- SV46 - RUH to LHR (Orta Doğu-Avrupa)
(46, 'Economy', 1500.00, 'SAR', 150),
(46, 'Business', 4500.00, 'SAR', 28),
(46, 'First', 9000.00, 'SAR', 9),

-- MS47 - CAI to IST (Afrika-Türkiye)
(47, 'Economy', 800.00, 'EGP', 180),
(47, 'Business', 2400.00, 'EGP', 35),
(47, 'First', 4800.00, 'EGP', 12),

-- SA48 - CPT to LHR (Afrika-Avrupa)
(48, 'Economy', 2500.00, 'ZAR', 120),
(48, 'Business', 7500.00, 'ZAR', 20),
(48, 'First', 15000.00, 'ZAR', 6),

-- LA49 - GRU to MAD (Güney Amerika-Avrupa)
(49, 'Economy', 3200.00, 'BRL', 110),
(49, 'Business', 9600.00, 'BRL', 18),
(49, 'First', 19200.00, 'BRL', 5),

-- AR50 - EZE to BCN (Güney Amerika-Avrupa)
(50, 'Economy', 2800.00, 'ARS', 115),
(50, 'Business', 8400.00, 'ARS', 20),
(50, 'First', 16800.00, 'ARS', 6),

-- QF51 - SYD to LHR (Okyanusya-Avrupa)
(51, 'Economy', 4500.00, 'AUD', 100),
(51, 'Business', 13500.00, 'AUD', 15),
(51, 'First', 27000.00, 'AUD', 4),

-- QF52 - MEL to CDG (Okyanusya-Avrupa)
(52, 'Economy', 4800.00, 'AUD', 95),
(52, 'Business', 14400.00, 'AUD', 12),
(52, 'First', 28800.00, 'AUD', 3),

-- NZ53 - AKL to LAX (Okyanusya-Amerika)
(53, 'Economy', 2200.00, 'NZD', 105),
(53, 'Business', 6600.00, 'NZD', 18),
(53, 'First', 13200.00, 'NZD', 5),

-- Türkiye içi uçuşlar (TK54-TK58)
(54, 'Economy', 450.00, 'TRY', 180),
(54, 'Business', 1350.00, 'TRY', 40),
(55, 'Economy', 380.00, 'TRY', 185),
(55, 'Business', 1140.00, 'TRY', 45),
(56, 'Economy', 320.00, 'TRY', 190),
(56, 'Business', 960.00, 'TRY', 48),
(57, 'Economy', 280.00, 'TRY', 195),
(57, 'Business', 840.00, 'TRY', 50),
(58, 'Economy', 350.00, 'TRY', 188),
(58, 'Business', 1050.00, 'TRY', 46),

-- Farklı durumlar (TK59-TK63)
(59, 'Economy', 2500.00, 'TRY', 150),
(59, 'Business', 7500.00, 'TRY', 20),
(60, 'Economy', 2200.00, 'TRY', 160),
(60, 'Business', 6600.00, 'TRY', 25),
(61, 'Economy', 2400.00, 'TRY', 155),
(61, 'Business', 7200.00, 'TRY', 22),
(62, 'Economy', 2300.00, 'TRY', 158),
(62, 'Business', 6900.00, 'TRY', 24),
(63, 'Economy', 2100.00, 'TRY', 165),
(63, 'Business', 6300.00, 'TRY', 28),

-- Gece uçuşları (TK64-TK66)
(64, 'Economy', 8500.00, 'TRY', 120),
(64, 'Business', 25000.00, 'TRY', 15),
(65, 'Economy', 9500.00, 'TRY', 110),
(65, 'Business', 28000.00, 'TRY', 12),
(66, 'Economy', 7800.00, 'TRY', 125),
(66, 'Business', 23000.00, 'TRY', 16),

-- Hafta sonu uçuşları (TK67-TK69)
(67, 'Economy', 2350.00, 'TRY', 156),
(67, 'Business', 7050.00, 'TRY', 23),
(68, 'Economy', 2600.00, 'TRY', 145),
(68, 'Business', 7800.00, 'TRY', 18),
(69, 'Economy', 2100.00, 'TRY', 165),
(69, 'Business', 6300.00, 'TRY', 28),

-- Tatil sezonu (TK70-TK72)
(70, 'Economy', 2450.00, 'TRY', 152),
(70, 'Business', 7350.00, 'TRY', 21),
(71, 'Economy', 2420.00, 'TRY', 153),
(71, 'Business', 7260.00, 'TRY', 20),
(72, 'Economy', 2400.00, 'TRY', 154),
(72, 'Business', 7200.00, 'TRY', 19),

-- Yeni yıl öncesi (TK73-TK75)
(73, 'Economy', 2800.00, 'TRY', 140),
(73, 'Business', 8400.00, 'TRY', 16),
(74, 'Economy', 2600.00, 'TRY', 145),
(74, 'Business', 7800.00, 'TRY', 18),
(75, 'Economy', 2700.00, 'TRY', 142),
(75, 'Business', 8100.00, 'TRY', 17),

-- Yeni yıl sonrası (TK76-TK78)
(76, 'Economy', 2400.00, 'TRY', 155),
(76, 'Business', 7200.00, 'TRY', 22),
(77, 'Economy', 2300.00, 'TRY', 158),
(77, 'Business', 6900.00, 'TRY', 24),
(78, 'Economy', 2350.00, 'TRY', 156),
(78, 'Business', 7050.00, 'TRY', 23),

-- İş seyahati (TK79-TK82)
(79, 'Economy', 2200.00, 'TRY', 160),
(79, 'Business', 6600.00, 'TRY', 25),
(80, 'Economy', 2400.00, 'TRY', 155),
(80, 'Business', 7200.00, 'TRY', 22),
(81, 'Economy', 2500.00, 'TRY', 150),
(81, 'Business', 7500.00, 'TRY', 20),
(82, 'Economy', 2300.00, 'TRY', 158),
(82, 'Business', 6900.00, 'TRY', 24),

-- Kısa mesafe (TK83-TK86)
(83, 'Economy', 450.00, 'TRY', 180),
(83, 'Business', 1350.00, 'TRY', 40),
(84, 'Economy', 380.00, 'TRY', 185),
(84, 'Business', 1140.00, 'TRY', 45),
(85, 'Economy', 320.00, 'TRY', 190),
(85, 'Business', 960.00, 'TRY', 48),
(86, 'Economy', 280.00, 'TRY', 195),
(86, 'Business', 840.00, 'TRY', 50),

-- Uzun mesafe (TK87-TK89)
(87, 'Economy', 12000.00, 'TRY', 80),
(87, 'Business', 35000.00, 'TRY', 10),
(87, 'First', 70000.00, 'TRY', 2),
(88, 'Economy', 11000.00, 'TRY', 85),
(88, 'Business', 32000.00, 'TRY', 12),
(88, 'First', 64000.00, 'TRY', 3),
(89, 'Economy', 9800.00, 'TRY', 90),
(89, 'Business', 29000.00, 'TRY', 15),
(89, 'First', 58000.00, 'TRY', 4),

-- Charter uçuşları (PC90-PC92)
(90, 'Economy', 1800.00, 'TRY', 170),
(90, 'Business', 5400.00, 'TRY', 30),
(91, 'Economy', 1750.00, 'TRY', 172),
(91, 'Business', 5250.00, 'TRY', 32),
(92, 'Economy', 1700.00, 'TRY', 175),
(92, 'Business', 5100.00, 'TRY', 35),

-- Kargo uçuşları (TK93-TK94)
(93, 'Economy', 2500.00, 'TRY', 150),
(93, 'Business', 7500.00, 'TRY', 20),
(94, 'Economy', 2400.00, 'TRY', 155),
(94, 'Business', 7200.00, 'TRY', 22),

-- Son uçuşlar (TK95-TK100)
(95, 'Economy', 2100.00, 'TRY', 165),
(95, 'Business', 6300.00, 'TRY', 28),
(96, 'Economy', 2300.00, 'TRY', 158),
(96, 'Business', 6900.00, 'TRY', 24),
(97, 'Economy', 2100.00, 'TRY', 165),
(97, 'Business', 6300.00, 'TRY', 28),
(98, 'Economy', 2600.00, 'TRY', 145),
(98, 'Business', 7800.00, 'TRY', 18),
(99, 'Economy', 2350.00, 'TRY', 156),
(99, 'Business', 7050.00, 'TRY', 23),
(100, 'Economy', 2500.00, 'TRY', 150),
(100, 'Business', 7500.00, 'TRY', 20);
