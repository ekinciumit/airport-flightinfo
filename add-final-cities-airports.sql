-- Doğru Country ID'leriyle şehirleri ekle
INSERT INTO Cities (Name, CountryId, FlightTime) VALUES
-- Türkiye (ID: 25)
('İstanbul', 25, '2-3 saat'),
('Ankara', 25, '1 saat'),
('İzmir', 25, '1-2 saat'),
('Antalya', 25, '1 saat'),
('Trabzon', 25, '1-2 saat'),

-- Almanya (ID: 26)
('Berlin', 26, '3-4 saat'),
('Münih', 26, '3 saat'),
('Frankfurt', 26, '3-4 saat'),
('Hamburg', 26, '3 saat'),
('Köln', 26, '3 saat'),

-- Fransa (ID: 27)
('Paris', 27, '3-4 saat'),
('Lyon', 27, '3 saat'),
('Marsilya', 27, '3-4 saat'),
('Nice', 27, '3 saat'),
('Toulouse', 27, '3-4 saat'),

-- İngiltere (ID: 28)
('Londra', 28, '4-5 saat'),
('Manchester', 28, '4 saat'),
('Birmingham', 28, '4-5 saat'),
('Edinburgh', 28, '5 saat'),
('Glasgow', 28, '5 saat'),

-- İtalya (ID: 29)
('Roma', 29, '2-3 saat'),
('Milano', 29, '2-3 saat'),
('Venedik', 29, '2-3 saat'),
('Floransa', 29, '2-3 saat'),
('Napoli', 29, '2-3 saat'),

-- İspanya (ID: 30)
('Madrid', 30, '3-4 saat'),
('Barcelona', 30, '3-4 saat'),
('Valencia', 30, '3-4 saat'),
('Sevilla', 30, '3-4 saat'),
('Bilbao', 30, '3-4 saat'),

-- Hollanda (ID: 31)
('Amsterdam', 31, '3-4 saat'),
('Rotterdam', 31, '3-4 saat'),
('Utrecht', 31, '3-4 saat'),

-- Amerika (ID: 32)
('New York', 32, '10-12 saat'),
('Los Angeles', 32, '12-14 saat'),
('Chicago', 32, '10-12 saat'),
('Miami', 32, '10-11 saat'),
('Las Vegas', 32, '12-14 saat'),

-- Kanada (ID: 33)
('Toronto', 33, '9-10 saat'),
('Vancouver', 33, '11-12 saat'),
('Montreal', 33, '9-10 saat'),

-- Japonya (ID: 34)
('Tokyo', 34, '10-12 saat'),
('Osaka', 34, '10-12 saat'),
('Kyoto', 34, '10-12 saat'),

-- Güney Kore (ID: 35)
('Seoul', 35, '9-10 saat'),

-- Singapur (ID: 36)
('Singapur', 36, '10-11 saat'),

-- BAE (ID: 37)
('Dubai', 37, '4-5 saat'),
('Abu Dhabi', 37, '4-5 saat'),

-- Suudi Arabistan (ID: 38)
('Riyad', 38, '3-4 saat'),

-- Mısır (ID: 39)
('Kahire', 39, '2-3 saat'),

-- Güney Afrika (ID: 40)
('Cape Town', 40, '8-9 saat'),

-- Brezilya (ID: 41)
('São Paulo', 41, '12-14 saat'),

-- Arjantin (ID: 42)
('Buenos Aires', 42, '14-16 saat'),

-- Avustralya (ID: 43)
('Sydney', 43, '15-17 saat'),
('Melbourne', 43, '15-17 saat'),

-- Yeni Zelanda (ID: 44)
('Auckland', 44, '17-19 saat');

-- Havalimanlarını ekle
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

-- Güney Kore
('ICN', 'Incheon Havalimanı', 45),

-- Singapur
('SIN', 'Changi Havalimanı', 46),

-- BAE
('DXB', 'Dubai Havalimanı', 47),
('AUH', 'Abu Dhabi Havalimanı', 48),

-- Suudi Arabistan
('RUH', 'Riyad Havalimanı', 49),

-- Mısır
('CAI', 'Kahire Havalimanı', 50),

-- Güney Afrika
('CPT', 'Cape Town Havalimanı', 51),

-- Brezilya
('GRU', 'São Paulo Havalimanı', 52),

-- Arjantin
('EZE', 'Buenos Aires Havalimanı', 53),

-- Avustralya
('SYD', 'Sydney Havalimanı', 54),
('MEL', 'Melbourne Havalimanı', 55),

-- Yeni Zelanda
('AKL', 'Auckland Havalimanı', 56);
