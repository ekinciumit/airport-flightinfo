-- Uçuş tablosuna havalimanı bilgilerini ekle
-- Önce mevcut uçuşları havalimanı kodları ile güncelle

-- Istanbul uçuşları
UPDATE Flights SET Origin = 'IST' WHERE Origin = 'Istanbul';
UPDATE Flights SET Destination = 'IST' WHERE Destination = 'Istanbul';

-- London uçuşları  
UPDATE Flights SET Origin = 'LHR' WHERE Origin = 'London';
UPDATE Flights SET Destination = 'LHR' WHERE Destination = 'London';

-- Paris uçuşları
UPDATE Flights SET Origin = 'CDG' WHERE Origin = 'Paris';
UPDATE Flights SET Destination = 'CDG' WHERE Destination = 'Paris';

-- Frankfurt uçuşları
UPDATE Flights SET Origin = 'FRA' WHERE Origin = 'Frankfurt';
UPDATE Flights SET Destination = 'FRA' WHERE Destination = 'Frankfurt';

-- Amsterdam uçuşları
UPDATE Flights SET Origin = 'AMS' WHERE Origin = 'Amsterdam';
UPDATE Flights SET Destination = 'AMS' WHERE Destination = 'Amsterdam';

-- Madrid uçuşları
UPDATE Flights SET Origin = 'MAD' WHERE Origin = 'Madrid';
UPDATE Flights SET Destination = 'MAD' WHERE Destination = 'Madrid';

-- Rome uçuşları
UPDATE Flights SET Origin = 'FCO' WHERE Origin = 'Rome';
UPDATE Flights SET Destination = 'FCO' WHERE Destination = 'Rome';

-- Vienna uçuşları
UPDATE Flights SET Origin = 'VIE' WHERE Origin = 'Vienna';
UPDATE Flights SET Destination = 'VIE' WHERE Destination = 'Vienna';

-- Zurich uçuşları
UPDATE Flights SET Origin = 'ZUR' WHERE Origin = 'Zurich';
UPDATE Flights SET Destination = 'ZUR' WHERE Destination = 'Zurich';

-- Berlin uçuşları
UPDATE Flights SET Origin = 'BER' WHERE Origin = 'Berlin';
UPDATE Flights SET Destination = 'BER' WHERE Destination = 'Berlin';

-- Munich uçuşları
UPDATE Flights SET Origin = 'MUC' WHERE Origin = 'Munich';
UPDATE Flights SET Destination = 'MUC' WHERE Destination = 'Munich';

-- Dubai uçuşları
UPDATE Flights SET Origin = 'DXB' WHERE Origin = 'Dubai';
UPDATE Flights SET Destination = 'DXB' WHERE Destination = 'Dubai';

-- Abu Dhabi uçuşları
UPDATE Flights SET Origin = 'AUH' WHERE Origin = 'Abu Dhabi';
UPDATE Flights SET Destination = 'AUH' WHERE Destination = 'Abu Dhabi';

-- Doha uçuşları
UPDATE Flights SET Origin = 'DOH' WHERE Origin = 'Doha';
UPDATE Flights SET Destination = 'DOH' WHERE Destination = 'Doha';

-- Tokyo uçuşları
UPDATE Flights SET Origin = 'NRT' WHERE Origin = 'Tokyo';
UPDATE Flights SET Destination = 'NRT' WHERE Destination = 'Tokyo';

-- Osaka uçuşları
UPDATE Flights SET Origin = 'KIX' WHERE Origin = 'Osaka';
UPDATE Flights SET Destination = 'KIX' WHERE Destination = 'Osaka';

-- Seoul uçuşları
UPDATE Flights SET Origin = 'ICN' WHERE Origin = 'Seoul';
UPDATE Flights SET Destination = 'ICN' WHERE Destination = 'Seoul';

-- Singapore uçuşları
UPDATE Flights SET Origin = 'SIN' WHERE Origin = 'Singapore';
UPDATE Flights SET Destination = 'SIN' WHERE Destination = 'Singapore';

-- Bangkok uçuşları
UPDATE Flights SET Origin = 'BKK' WHERE Origin = 'Bangkok';
UPDATE Flights SET Destination = 'BKK' WHERE Destination = 'Bangkok';

-- New York uçuşları
UPDATE Flights SET Origin = 'JFK' WHERE Origin = 'New York';
UPDATE Flights SET Destination = 'JFK' WHERE Destination = 'New York';

-- Los Angeles uçuşları
UPDATE Flights SET Origin = 'LAX' WHERE Origin = 'Los Angeles';
UPDATE Flights SET Destination = 'LAX' WHERE Destination = 'Los Angeles';

-- Chicago uçuşları
UPDATE Flights SET Origin = 'ORD' WHERE Origin = 'Chicago';
UPDATE Flights SET Destination = 'ORD' WHERE Destination = 'Chicago';

-- Miami uçuşları
UPDATE Flights SET Origin = 'MIA' WHERE Origin = 'Miami';
UPDATE Flights SET Destination = 'MIA' WHERE Destination = 'Miami';

-- Moscow uçuşları
UPDATE Flights SET Origin = 'SVO' WHERE Origin = 'Moscow';
UPDATE Flights SET Destination = 'SVO' WHERE Destination = 'Moscow';

-- Kiev uçuşları
UPDATE Flights SET Origin = 'KBP' WHERE Origin = 'Kiev';
UPDATE Flights SET Destination = 'KBP' WHERE Destination = 'Kiev';

-- Minsk uçuşları
UPDATE Flights SET Origin = 'MSQ' WHERE Origin = 'Minsk';
UPDATE Flights SET Destination = 'MSQ' WHERE Destination = 'Minsk';

-- Ankara uçuşları
UPDATE Flights SET Origin = 'ESB' WHERE Origin = 'Ankara';
UPDATE Flights SET Destination = 'ESB' WHERE Destination = 'Ankara';

-- Izmir uçuşları
UPDATE Flights SET Origin = 'ADB' WHERE Origin = 'Izmir';
UPDATE Flights SET Destination = 'ADB' WHERE Destination = 'Izmir';

-- Antalya uçuşları
UPDATE Flights SET Origin = 'AYT' WHERE Origin = 'Antalya';
UPDATE Flights SET Destination = 'AYT' WHERE Destination = 'Antalya';

-- Trabzon uçuşları
UPDATE Flights SET Origin = 'TZX' WHERE Origin = 'Trabzon';
UPDATE Flights SET Destination = 'TZX' WHERE Destination = 'Trabzon';

-- Adana uçuşları
UPDATE Flights SET Origin = 'ADA' WHERE Origin = 'Adana';
UPDATE Flights SET Destination = 'ADA' WHERE Destination = 'Adana';

-- Gaziantep uçuşları
UPDATE Flights SET Origin = 'GZT' WHERE Origin = 'Gaziantep';
UPDATE Flights SET Destination = 'GZT' WHERE Destination = 'Gaziantep';

-- Kayseri uçuşları
UPDATE Flights SET Origin = 'ASR' WHERE Origin = 'Kayseri';
UPDATE Flights SET Destination = 'ASR' WHERE Destination = 'Kayseri';

-- Samsun uçuşları
UPDATE Flights SET Origin = 'SZF' WHERE Origin = 'Samsun';
UPDATE Flights SET Destination = 'SZF' WHERE Destination = 'Samsun';

-- Diyarbakir uçuşları
UPDATE Flights SET Origin = 'DIY' WHERE Origin = 'Diyarbakir';
UPDATE Flights SET Destination = 'DIY' WHERE Destination = 'Diyarbakir';

-- Van uçuşları
UPDATE Flights SET Origin = 'VAN' WHERE Origin = 'Van';
UPDATE Flights SET Destination = 'VAN' WHERE Destination = 'Van';

-- Erzurum uçuşları
UPDATE Flights SET Origin = 'ERZ' WHERE Origin = 'Erzurum';
UPDATE Flights SET Destination = 'ERZ' WHERE Destination = 'Erzurum';

-- Malatya uçuşları
UPDATE Flights SET Origin = 'MLX' WHERE Origin = 'Malatya';
UPDATE Flights SET Destination = 'MLX' WHERE Destination = 'Malatya';

-- Sabiha Gokcen uçuşları
UPDATE Flights SET Origin = 'SAW' WHERE Origin = 'Sabiha Gokcen';
UPDATE Flights SET Destination = 'SAW' WHERE Destination = 'Sabiha Gokcen';

-- Hamburg uçuşları
UPDATE Flights SET Origin = 'HAM' WHERE Origin = 'Hamburg';
UPDATE Flights SET Destination = 'HAM' WHERE Destination = 'Hamburg';

-- Dusseldorf uçuşları
UPDATE Flights SET Origin = 'DUS' WHERE Origin = 'Dusseldorf';
UPDATE Flights SET Destination = 'DUS' WHERE Destination = 'Dusseldorf';

-- Stuttgart uçuşları
UPDATE Flights SET Origin = 'STR' WHERE Origin = 'Stuttgart';
UPDATE Flights SET Destination = 'STR' WHERE Destination = 'Stuttgart';

-- Gatwick uçuşları
UPDATE Flights SET Origin = 'LGW' WHERE Origin = 'Gatwick';
UPDATE Flights SET Destination = 'LGW' WHERE Destination = 'Gatwick';

-- Manchester uçuşları
UPDATE Flights SET Origin = 'MAN' WHERE Origin = 'Manchester';
UPDATE Flights SET Destination = 'MAN' WHERE Destination = 'Manchester';

-- Birmingham uçuşları
UPDATE Flights SET Origin = 'BHX' WHERE Origin = 'Birmingham';
UPDATE Flights SET Destination = 'BHX' WHERE Destination = 'Birmingham';

-- Orly uçuşları
UPDATE Flights SET Origin = 'ORY' WHERE Origin = 'Orly';
UPDATE Flights SET Destination = 'ORY' WHERE Destination = 'Orly';

-- Lyon uçuşları
UPDATE Flights SET Origin = 'LYS' WHERE Origin = 'Lyon';
UPDATE Flights SET Destination = 'LYS' WHERE Destination = 'Lyon';

-- Marseille uçuşları
UPDATE Flights SET Origin = 'MRS' WHERE Origin = 'Marseille';
UPDATE Flights SET Destination = 'MRS' WHERE Destination = 'Marseille';

-- Milan uçuşları
UPDATE Flights SET Origin = 'MXP' WHERE Origin = 'Milan';
UPDATE Flights SET Destination = 'MXP' WHERE Destination = 'Milan';

-- Naples uçuşları
UPDATE Flights SET Origin = 'NAP' WHERE Origin = 'Naples';
UPDATE Flights SET Destination = 'NAP' WHERE Destination = 'Naples';

-- Venice uçuşları
UPDATE Flights SET Origin = 'VCE' WHERE Origin = 'Venice';
UPDATE Flights SET Destination = 'VCE' WHERE Destination = 'Venice';

-- Barcelona uçuşları
UPDATE Flights SET Origin = 'BCN' WHERE Origin = 'Barcelona';
UPDATE Flights SET Destination = 'BCN' WHERE Destination = 'Barcelona';

-- Malaga uçuşları
UPDATE Flights SET Origin = 'AGP' WHERE Origin = 'Malaga';
UPDATE Flights SET Destination = 'AGP' WHERE Destination = 'Malaga';
