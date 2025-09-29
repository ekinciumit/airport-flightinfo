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
