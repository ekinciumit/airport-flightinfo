-- Mevcut test verilerini temizle
DELETE FROM Logs;
DELETE FROM Reservations;
DELETE FROM FlightPrices;
DELETE FROM FlightStatusHistory;
DELETE FROM Flights;
DELETE FROM Airports;
DELETE FROM Cities;
DELETE FROM Countries;

-- Ülkeleri ekle
INSERT INTO Countries (Code, Name) VALUES
('TR', 'Türkiye'),
('DE', 'Almanya'),
('FR', 'Fransa'),
('GB', 'İngiltere'),
('IT', 'İtalya'),
('ES', 'İspanya'),
('NL', 'Hollanda'),
('US', 'Amerika Birleşik Devletleri'),
('CA', 'Kanada'),
('JP', 'Japonya'),
('KR', 'Güney Kore'),
('SG', 'Singapur'),
('AE', 'Birleşik Arap Emirlikleri'),
('SA', 'Suudi Arabistan'),
('EG', 'Mısır'),
('ZA', 'Güney Afrika'),
('BR', 'Brezilya'),
('AR', 'Arjantin'),
('AU', 'Avustralya'),
('NZ', 'Yeni Zelanda');

-- Şehirleri ekle
INSERT INTO Cities (Name, CountryId, FlightTime) VALUES
-- Türkiye
('İstanbul', 1, '2-3 saat'),
('Ankara', 1, '1 saat'),
('İzmir', 1, '1-2 saat'),
('Antalya', 1, '1 saat'),
('Trabzon', 1, '1-2 saat'),

-- Almanya
('Berlin', 2, '3-4 saat'),
('Münih', 2, '3 saat'),
('Frankfurt', 2, '3-4 saat'),
('Hamburg', 2, '3 saat'),
('Köln', 2, '3 saat'),

-- Fransa
('Paris', 3, '3-4 saat'),
('Lyon', 3, '3 saat'),
('Marsilya', 3, '3-4 saat'),
('Nice', 3, '3 saat'),
('Toulouse', 3, '3-4 saat'),

-- İngiltere
('Londra', 4, '4-5 saat'),
('Manchester', 4, '4 saat'),
('Birmingham', 4, '4-5 saat'),
('Edinburgh', 4, '5 saat'),
('Glasgow', 4, '5 saat'),

-- İtalya
('Roma', 5, '2-3 saat'),
('Milano', 5, '2-3 saat'),
('Venedik', 5, '2-3 saat'),
('Floransa', 5, '2-3 saat'),
('Napoli', 5, '2-3 saat'),

-- İspanya
('Madrid', 6, '3-4 saat'),
('Barcelona', 6, '3-4 saat'),
('Valencia', 6, '3-4 saat'),
('Sevilla', 6, '3-4 saat'),
('Bilbao', 6, '3-4 saat'),

-- Hollanda
('Amsterdam', 7, '3-4 saat'),
('Rotterdam', 7, '3-4 saat'),
('Utrecht', 7, '3-4 saat'),

-- Amerika
('New York', 8, '10-12 saat'),
('Los Angeles', 8, '12-14 saat'),
('Chicago', 8, '10-12 saat'),
('Miami', 8, '10-11 saat'),
('Las Vegas', 8, '12-14 saat'),

-- Kanada
('Toronto', 9, '9-10 saat'),
('Vancouver', 9, '11-12 saat'),
('Montreal', 9, '9-10 saat'),

-- Japonya
('Tokyo', 10, '10-12 saat'),
('Osaka', 10, '10-12 saat'),
('Kyoto', 10, '10-12 saat'),

-- Diğer Asya
('Seoul', 11, '9-10 saat'),
('Singapur', 12, '10-11 saat'),

-- Orta Doğu
('Dubai', 13, '4-5 saat'),
('Abu Dhabi', 13, '4-5 saat'),
('Riyad', 14, '3-4 saat'),

-- Afrika
('Kahire', 15, '2-3 saat'),
('Cape Town', 16, '8-9 saat'),

-- Güney Amerika
('São Paulo', 17, '12-14 saat'),
('Buenos Aires', 18, '14-16 saat'),

-- Okyanusya
('Sydney', 19, '15-17 saat'),
('Melbourne', 19, '15-17 saat'),
('Auckland', 20, '17-19 saat');

-- Havalimanları ekle
INSERT INTO Airports (Code, Name, CityId) VALUES
-- Türkiye
('IST', 'İstanbul Havalimanı', 1),
('SAW', 'Sabiha Gökçen Havalimanı', 1),
('ESB', 'Esenboğa Havalimanı', 2),
('ADB', 'Adnan Menderes Havalimanı', 3),
('AYT', 'Antalya Havalimanı', 4),
('TZX', 'Trabzon Havalimanı', 5),

-- Almanya
('BER', 'Berlin Brandenburg Havalimanı', 6),
('MUC', 'Münih Havalimanı', 7),
('FRA', 'Frankfurt Havalimanı', 8),
('HAM', 'Hamburg Havalimanı', 9),
('CGN', 'Köln Havalimanı', 10),

-- Fransa
('CDG', 'Charles de Gaulle Havalimanı', 11),
('ORY', 'Orly Havalimanı', 11),
('LYS', 'Lyon Havalimanı', 12),
('MRS', 'Marsilya Havalimanı', 13),
('NCE', 'Nice Havalimanı', 14),
('TLS', 'Toulouse Havalimanı', 15),

-- İngiltere
('LHR', 'Heathrow Havalimanı', 16),
('LGW', 'Gatwick Havalimanı', 16),
('MAN', 'Manchester Havalimanı', 17),
('BHX', 'Birmingham Havalimanı', 18),
('EDI', 'Edinburgh Havalimanı', 19),
('GLA', 'Glasgow Havalimanı', 20),

-- İtalya
('FCO', 'Roma Fiumicino Havalimanı', 21),
('MXP', 'Milano Malpensa Havalimanı', 22),
('VCE', 'Venedik Havalimanı', 23),
('FLR', 'Floransa Havalimanı', 24),
('NAP', 'Napoli Havalimanı', 25),

-- İspanya
('MAD', 'Madrid Barajas Havalimanı', 26),
('BCN', 'Barcelona Havalimanı', 27),
('VLC', 'Valencia Havalimanı', 28),
('SVQ', 'Sevilla Havalimanı', 29),
('BIO', 'Bilbao Havalimanı', 30),

-- Hollanda
('AMS', 'Amsterdam Schiphol Havalimanı', 31),
('RTM', 'Rotterdam Havalimanı', 32),
('UTC', 'Utrecht Havalimanı', 33),

-- Amerika
('JFK', 'John F. Kennedy Havalimanı', 34),
('LGA', 'LaGuardia Havalimanı', 34),
('LAX', 'Los Angeles Havalimanı', 35),
('ORD', 'Chicago O''Hare Havalimanı', 36),
('MIA', 'Miami Havalimanı', 37),
('LAS', 'Las Vegas Havalimanı', 38),

-- Kanada
('YYZ', 'Toronto Pearson Havalimanı', 39),
('YVR', 'Vancouver Havalimanı', 40),
('YUL', 'Montreal Havalimanı', 41),

-- Japonya
('NRT', 'Narita Havalimanı', 42),
('HND', 'Haneda Havalimanı', 42),
('KIX', 'Kansai Havalimanı', 43),
('UKY', 'Kyoto Havalimanı', 44),

-- Diğer Asya
('ICN', 'Incheon Havalimanı', 45),
('SIN', 'Changi Havalimanı', 46),

-- Orta Doğu
('DXB', 'Dubai Havalimanı', 47),
('AUH', 'Abu Dhabi Havalimanı', 48),
('RUH', 'Riyad Havalimanı', 49),

-- Afrika
('CAI', 'Kahire Havalimanı', 50),
('CPT', 'Cape Town Havalimanı', 51),

-- Güney Amerika
('GRU', 'São Paulo Havalimanı', 52),
('EZE', 'Buenos Aires Havalimanı', 53),

-- Okyanusya
('SYD', 'Sydney Havalimanı', 54),
('MEL', 'Melbourne Havalimanı', 55),
('AKL', 'Auckland Havalimanı', 56);

-- 100 farklı uçuş ekle
INSERT INTO Flights (FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, Status) VALUES
-- Türkiye - Avrupa
('TK1', 'IST', 'LHR', '2024-12-01 08:00:00', '2024-12-01 11:30:00', 'Scheduled'),
('TK2', 'IST', 'CDG', '2024-12-01 09:30:00', '2024-12-01 12:45:00', 'Scheduled'),
('TK3', 'IST', 'FRA', '2024-12-01 10:15:00', '2024-12-01 13:30:00', 'Scheduled'),
('TK4', 'IST', 'AMS', '2024-12-01 11:00:00', '2024-12-01 14:15:00', 'Scheduled'),
('TK5', 'IST', 'FCO', '2024-12-01 12:30:00', '2024-12-01 15:45:00', 'Scheduled'),
('TK6', 'IST', 'MAD', '2024-12-01 13:45:00', '2024-12-01 17:00:00', 'Scheduled'),
('TK7', 'IST', 'MUC', '2024-12-01 14:20:00', '2024-12-01 17:35:00', 'Scheduled'),
('TK8', 'IST', 'BCN', '2024-12-01 15:10:00', '2024-12-01 18:25:00', 'Scheduled'),
('TK9', 'IST', 'BER', '2024-12-01 16:00:00', '2024-12-01 19:15:00', 'Scheduled'),
('TK10', 'IST', 'MXP', '2024-12-01 17:30:00', '2024-12-01 20:45:00', 'Scheduled'),

-- Türkiye - Amerika
('TK11', 'IST', 'JFK', '2024-12-02 22:00:00', '2024-12-03 08:00:00', 'Scheduled'),
('TK12', 'IST', 'LAX', '2024-12-02 23:30:00', '2024-12-03 09:30:00', 'Scheduled'),
('TK13', 'IST', 'ORD', '2024-12-03 00:15:00', '2024-12-03 10:15:00', 'Scheduled'),
('TK14', 'IST', 'MIA', '2024-12-03 01:00:00', '2024-12-03 11:00:00', 'Scheduled'),
('TK15', 'IST', 'LAS', '2024-12-03 02:30:00', '2024-12-03 12:30:00', 'Scheduled'),

-- Türkiye - Asya
('TK16', 'IST', 'NRT', '2024-12-03 20:00:00', '2024-12-04 10:00:00', 'Scheduled'),
('TK17', 'IST', 'ICN', '2024-12-03 21:30:00', '2024-12-04 11:30:00', 'Scheduled'),
('TK18', 'IST', 'SIN', '2024-12-03 22:15:00', '2024-12-04 12:15:00', 'Scheduled'),
('TK19', 'IST', 'DXB', '2024-12-04 00:30:00', '2024-12-04 05:30:00', 'Scheduled'),
('TK20', 'IST', 'AUH', '2024-12-04 01:45:00', '2024-12-04 06:45:00', 'Scheduled'),

-- Avrupa - Türkiye
('LH21', 'FRA', 'IST', '2024-12-04 08:30:00', '2024-12-04 12:45:00', 'Scheduled'),
('AF22', 'CDG', 'IST', '2024-12-04 09:15:00', '2024-12-04 13:30:00', 'Scheduled'),
('BA23', 'LHR', 'IST', '2024-12-04 10:00:00', '2024-12-04 14:15:00', 'Scheduled'),
('KL24', 'AMS', 'IST', '2024-12-04 11:30:00', '2024-12-04 15:45:00', 'Scheduled'),
('AZ25', 'FCO', 'IST', '2024-12-04 12:45:00', '2024-12-04 17:00:00', 'Scheduled'),

-- Avrupa İçi
('LH26', 'FRA', 'LHR', '2024-12-04 14:00:00', '2024-12-04 15:30:00', 'Scheduled'),
('AF27', 'CDG', 'BCN', '2024-12-04 15:30:00', '2024-12-04 17:00:00', 'Scheduled'),
('BA28', 'LHR', 'MAD', '2024-12-04 16:15:00', '2024-12-04 18:45:00', 'Scheduled'),
('KL29', 'AMS', 'FCO', '2024-12-04 17:45:00', '2024-12-04 20:15:00', 'Scheduled'),
('AZ30', 'MXP', 'CDG', '2024-12-04 18:30:00', '2024-12-04 20:00:00', 'Scheduled'),

-- Amerika İçi
('AA31', 'JFK', 'LAX', '2024-12-05 08:00:00', '2024-12-05 11:00:00', 'Scheduled'),
('UA32', 'ORD', 'MIA', '2024-12-05 09:30:00', '2024-12-05 12:30:00', 'Scheduled'),
('DL33', 'LAX', 'LAS', '2024-12-05 10:15:00', '2024-12-05 11:45:00', 'Scheduled'),
('AA34', 'MIA', 'ORD', '2024-12-05 11:45:00', '2024-12-05 14:45:00', 'Scheduled'),
('UA35', 'LAS', 'JFK', '2024-12-05 12:30:00', '2024-12-05 20:30:00', 'Scheduled'),

-- Kanada - Amerika
('AC36', 'YYZ', 'JFK', '2024-12-05 14:00:00', '2024-12-05 16:00:00', 'Scheduled'),
('AC37', 'YVR', 'LAX', '2024-12-05 15:30:00', '2024-12-05 17:30:00', 'Scheduled'),
('AC38', 'YUL', 'ORD', '2024-12-05 16:15:00', '2024-12-05 18:15:00', 'Scheduled'),

-- Asya İçi
('NH39', 'NRT', 'ICN', '2024-12-06 08:00:00', '2024-12-06 10:30:00', 'Scheduled'),
('KE40', 'ICN', 'SIN', '2024-12-06 09:30:00', '2024-12-06 14:30:00', 'Scheduled'),
('SQ41', 'SIN', 'NRT', '2024-12-06 11:00:00', '2024-12-06 18:00:00', 'Scheduled'),
('NH42', 'HND', 'KIX', '2024-12-06 12:30:00', '2024-12-06 14:00:00', 'Scheduled'),
('KE43', 'ICN', 'DXB', '2024-12-06 13:45:00', '2024-12-06 20:45:00', 'Scheduled'),

-- Orta Doğu
('EK44', 'DXB', 'IST', '2024-12-06 16:00:00', '2024-12-06 20:00:00', 'Scheduled'),
('EY45', 'AUH', 'CDG', '2024-12-06 17:30:00', '2024-12-06 22:30:00', 'Scheduled'),
('SV46', 'RUH', 'LHR', '2024-12-06 18:15:00', '2024-12-06 23:15:00', 'Scheduled'),

-- Afrika
('MS47', 'CAI', 'IST', '2024-12-07 08:00:00', '2024-12-07 11:00:00', 'Scheduled'),
('SA48', 'CPT', 'LHR', '2024-12-07 20:00:00', '2024-12-08 06:00:00', 'Scheduled'),

-- Güney Amerika
('LA49', 'GRU', 'MAD', '2024-12-08 22:00:00', '2024-12-09 12:00:00', 'Scheduled'),
('AR50', 'EZE', 'BCN', '2024-12-08 23:30:00', '2024-12-09 13:30:00', 'Scheduled'),

-- Okyanusya
('QF51', 'SYD', 'LHR', '2024-12-09 22:00:00', '2024-12-10 12:00:00', 'Scheduled'),
('QF52', 'MEL', 'CDG', '2024-12-09 23:30:00', '2024-12-10 13:30:00', 'Scheduled'),
('NZ53', 'AKL', 'LAX', '2024-12-10 00:15:00', '2024-12-10 14:15:00', 'Scheduled'),

-- Türkiye İçi
('TK54', 'IST', 'ESB', '2024-12-10 08:00:00', '2024-12-10 09:30:00', 'Scheduled'),
('TK55', 'IST', 'ADB', '2024-12-10 09:30:00', '2024-12-10 11:00:00', 'Scheduled'),
('TK56', 'IST', 'AYT', '2024-12-10 10:15:00', '2024-12-10 11:45:00', 'Scheduled'),
('TK57', 'IST', 'TZX', '2024-12-10 11:30:00', '2024-12-10 13:00:00', 'Scheduled'),
('TK58', 'ESB', 'AYT', '2024-12-10 12:45:00', '2024-12-10 14:15:00', 'Scheduled'),

-- Farklı Durumlar
('TK59', 'IST', 'LHR', '2024-12-11 08:00:00', '2024-12-11 11:30:00', 'Delayed'),
('TK60', 'IST', 'CDG', '2024-12-11 09:30:00', '2024-12-11 12:45:00', 'Boarding'),
('TK61', 'IST', 'FRA', '2024-12-11 10:15:00', '2024-12-11 13:30:00', 'Departed'),
('TK62', 'IST', 'AMS', '2024-12-11 11:00:00', '2024-12-11 14:15:00', 'Arrived'),
('TK63', 'IST', 'FCO', '2024-12-11 12:30:00', '2024-12-11 15:45:00', 'Cancelled'),

-- Gece Uçuşları
('TK64', 'IST', 'JFK', '2024-12-12 01:00:00', '2024-12-12 09:00:00', 'Scheduled'),
('TK65', 'IST', 'LAX', '2024-12-12 02:30:00', '2024-12-12 10:30:00', 'Scheduled'),
('TK66', 'IST', 'NRT', '2024-12-12 23:00:00', '2024-12-13 13:00:00', 'Scheduled'),

-- Hafta Sonu Uçuşları
('TK67', 'IST', 'BCN', '2024-12-14 08:00:00', '2024-12-14 11:15:00', 'Scheduled'),
('TK68', 'IST', 'MAD', '2024-12-14 09:30:00', '2024-12-14 12:45:00', 'Scheduled'),
('TK69', 'IST', 'FCO', '2024-12-14 10:45:00', '2024-12-14 14:00:00', 'Scheduled'),

-- Tatil Sezonu
('TK70', 'IST', 'MUC', '2024-12-21 08:00:00', '2024-12-21 11:15:00', 'Scheduled'),
('TK71', 'IST', 'BER', '2024-12-21 09:30:00', '2024-12-21 12:45:00', 'Scheduled'),
('TK72', 'IST', 'HAM', '2024-12-21 10:15:00', '2024-12-21 13:30:00', 'Scheduled'),

-- Yeni Yıl Öncesi
('TK73', 'IST', 'LHR', '2024-12-30 08:00:00', '2024-12-30 11:30:00', 'Scheduled'),
('TK74', 'IST', 'CDG', '2024-12-30 09:30:00', '2024-12-30 12:45:00', 'Scheduled'),
('TK75', 'IST', 'AMS', '2024-12-30 10:15:00', '2024-12-30 13:30:00', 'Scheduled'),

-- Yeni Yıl Sonrası
('TK76', 'LHR', 'IST', '2025-01-02 08:00:00', '2025-01-02 12:15:00', 'Scheduled'),
('TK77', 'CDG', 'IST', '2025-01-02 09:30:00', '2025-01-02 13:45:00', 'Scheduled'),
('TK78', 'AMS', 'IST', '2025-01-02 10:15:00', '2025-01-02 14:30:00', 'Scheduled'),

-- İş Seyahati Uçuşları
('TK79', 'IST', 'FRA', '2025-01-06 07:00:00', '2025-01-06 10:15:00', 'Scheduled'),
('TK80', 'FRA', 'IST', '2025-01-06 18:00:00', '2025-01-06 22:15:00', 'Scheduled'),
('TK81', 'IST', 'LHR', '2025-01-07 07:30:00', '2025-01-07 11:00:00', 'Scheduled'),
('TK82', 'LHR', 'IST', '2025-01-07 17:30:00', '2025-01-07 21:45:00', 'Scheduled'),

-- Kısa Mesafe Uçuşları
('TK83', 'IST', 'ESB', '2025-01-08 08:00:00', '2025-01-08 09:30:00', 'Scheduled'),
('TK84', 'IST', 'ADB', '2025-01-08 08:30:00', '2025-01-08 10:00:00', 'Scheduled'),
('TK85', 'IST', 'AYT', '2025-01-08 09:00:00', '2025-01-08 10:30:00', 'Scheduled'),
('TK86', 'IST', 'TZX', '2025-01-08 09:30:00', '2025-01-08 11:00:00', 'Scheduled'),

-- Uzun Mesafe Uçuşları
('TK87', 'IST', 'SYD', '2025-01-09 22:00:00', '2025-01-11 08:00:00', 'Scheduled'),
('TK88', 'IST', 'GRU', '2025-01-10 22:30:00', '2025-01-11 12:30:00', 'Scheduled'),
('TK89', 'IST', 'LAX', '2025-01-11 00:00:00', '2025-01-11 10:00:00', 'Scheduled'),

-- Charter Uçuşları
('PC90', 'AYT', 'BER', '2025-01-12 10:00:00', '2025-01-12 13:15:00', 'Scheduled'),
('PC91', 'AYT', 'MUC', '2025-01-12 11:00:00', '2025-01-12 14:15:00', 'Scheduled'),
('PC92', 'AYT', 'HAM', '2025-01-12 12:00:00', '2025-01-12 15:15:00', 'Scheduled'),

-- Kargo Uçuşları
('TK93', 'IST', 'LHR', '2025-01-13 02:00:00', '2025-01-13 05:30:00', 'Scheduled'),
('TK94', 'IST', 'FRA', '2025-01-13 03:00:00', '2025-01-13 06:15:00', 'Scheduled'),

-- Son Uçuşlar
('TK95', 'IST', 'CDG', '2025-01-14 08:00:00', '2025-01-14 11:15:00', 'Scheduled'),
('TK96', 'IST', 'AMS', '2025-01-14 09:30:00', '2025-01-14 12:45:00', 'Scheduled'),
('TK97', 'IST', 'FCO', '2025-01-14 10:15:00', '2025-01-14 13:30:00', 'Scheduled'),
('TK98', 'IST', 'MAD', '2025-01-14 11:00:00', '2025-01-14 14:15:00', 'Scheduled'),
('TK99', 'IST', 'BCN', '2025-01-14 12:30:00', '2025-01-14 15:45:00', 'Scheduled'),
('TK100', 'IST', 'LHR', '2025-01-14 13:45:00', '2025-01-14 17:00:00', 'Scheduled');
