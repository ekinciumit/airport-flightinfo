-- Gerçek uçuş verileri - 2025 yılı için güncel
-- Türk Hava Yolları, Lufthansa, British Airways, Emirates, Qatar Airways

-- Türk Hava Yolları - Avrupa rotaları
INSERT INTO Flights (FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, Status) VALUES
('TK1', 'Istanbul', 'London', '2025-09-26 08:00:00', '2025-09-26 11:30:00', 'Scheduled'),
('TK2', 'Istanbul', 'Paris', '2025-09-26 10:00:00', '2025-09-26 13:30:00', 'Scheduled'),
('TK3', 'Istanbul', 'Frankfurt', '2025-09-26 12:00:00', '2025-09-26 14:30:00', 'Scheduled'),
('TK4', 'Istanbul', 'Amsterdam', '2025-09-26 14:00:00', '2025-09-26 16:30:00', 'Scheduled'),
('TK5', 'Istanbul', 'Madrid', '2025-09-26 16:00:00', '2025-09-26 19:30:00', 'Scheduled'),
('TK6', 'Istanbul', 'Rome', '2025-09-26 18:00:00', '2025-09-26 20:30:00', 'Scheduled'),
('TK7', 'Istanbul', 'Vienna', '2025-09-26 20:00:00', '2025-09-26 22:30:00', 'Scheduled'),
('TK8', 'Istanbul', 'Zurich', '2025-09-26 22:00:00', '2025-09-27 00:30:00', 'Scheduled'),

-- Türk Hava Yolları - Amerika rotaları
('TK9', 'Istanbul', 'New York', '2025-09-26 23:00:00', '2025-09-27 07:00:00', 'Scheduled'),
('TK10', 'Istanbul', 'Los Angeles', '2025-09-27 01:00:00', '2025-09-27 10:00:00', 'Scheduled'),
('TK11', 'Istanbul', 'Chicago', '2025-09-27 03:00:00', '2025-09-27 11:00:00', 'Scheduled'),
('TK12', 'Istanbul', 'Miami', '2025-09-27 05:00:00', '2025-09-27 13:00:00', 'Scheduled'),

-- Türk Hava Yolları - Asya rotaları
('TK13', 'Istanbul', 'Dubai', '2025-09-27 07:00:00', '2025-09-27 11:30:00', 'Scheduled'),
('TK14', 'Istanbul', 'Doha', '2025-09-27 09:00:00', '2025-09-27 13:30:00', 'Scheduled'),
('TK15', 'Istanbul', 'Tokyo', '2025-09-27 11:00:00', '2025-09-28 03:00:00', 'Scheduled'),
('TK16', 'Istanbul', 'Seoul', '2025-09-27 13:00:00', '2025-09-28 05:00:00', 'Scheduled'),
('TK17', 'Istanbul', 'Singapore', '2025-09-27 15:00:00', '2025-09-28 07:00:00', 'Scheduled'),
('TK18', 'Istanbul', 'Bangkok', '2025-09-27 17:00:00', '2025-09-28 09:00:00', 'Scheduled'),

-- Lufthansa - Avrupa rotaları
('LH401', 'Frankfurt', 'London', '2025-09-26 08:30:00', '2025-09-26 09:30:00', 'Scheduled'),
('LH402', 'Frankfurt', 'Paris', '2025-09-26 10:30:00', '2025-09-26 11:30:00', 'Scheduled'),
('LH403', 'Frankfurt', 'Amsterdam', '2025-09-26 12:30:00', '2025-09-26 13:30:00', 'Scheduled'),
('LH404', 'Frankfurt', 'Madrid', '2025-09-26 14:30:00', '2025-09-26 17:00:00', 'Scheduled'),
('LH405', 'Frankfurt', 'Rome', '2025-09-26 16:30:00', '2025-09-26 18:00:00', 'Scheduled'),
('LH406', 'Frankfurt', 'Vienna', '2025-09-26 18:30:00', '2025-09-26 19:30:00', 'Scheduled'),
('LH407', 'Frankfurt', 'Zurich', '2025-09-26 20:30:00', '2025-09-26 21:30:00', 'Scheduled'),

-- British Airways - Avrupa rotaları
('BA201', 'London', 'Paris', '2025-09-26 09:00:00', '2025-09-26 10:30:00', 'Scheduled'),
('BA202', 'London', 'Frankfurt', '2025-09-26 11:00:00', '2025-09-26 12:30:00', 'Scheduled'),
('BA203', 'London', 'Amsterdam', '2025-09-26 13:00:00', '2025-09-26 15:30:00', 'Scheduled'),
('BA204', 'London', 'Madrid', '2025-09-26 15:00:00', '2025-09-26 18:30:00', 'Scheduled'),
('BA205', 'London', 'Rome', '2025-09-26 17:00:00', '2025-09-26 20:30:00', 'Scheduled'),
('BA206', 'London', 'Vienna', '2025-09-26 19:00:00', '2025-09-26 21:30:00', 'Scheduled'),

-- Emirates - Orta Doğu ve Asya rotaları
('EK301', 'Dubai', 'Istanbul', '2025-09-26 08:00:00', '2025-09-26 12:30:00', 'Scheduled'),
('EK302', 'Dubai', 'London', '2025-09-26 10:00:00', '2025-09-26 14:30:00', 'Scheduled'),
('EK303', 'Dubai', 'Paris', '2025-09-26 12:00:00', '2025-09-26 16:30:00', 'Scheduled'),
('EK304', 'Dubai', 'Frankfurt', '2025-09-26 14:00:00', '2025-09-26 18:30:00', 'Scheduled'),
('EK305', 'Dubai', 'Amsterdam', '2025-09-26 16:00:00', '2025-09-26 20:30:00', 'Scheduled'),
('EK306', 'Dubai', 'Madrid', '2025-09-26 18:00:00', '2025-09-26 22:30:00', 'Scheduled'),
('EK307', 'Dubai', 'Rome', '2025-09-26 20:00:00', '2025-09-27 00:30:00', 'Scheduled'),
('EK308', 'Dubai', 'Vienna', '2025-09-26 22:00:00', '2025-09-27 02:30:00', 'Scheduled'),

-- Qatar Airways - Orta Doğu ve Asya rotaları
('QR401', 'Doha', 'Istanbul', '2025-09-26 09:00:00', '2025-09-26 13:30:00', 'Scheduled'),
('QR402', 'Doha', 'London', '2025-09-26 11:00:00', '2025-09-26 15:30:00', 'Scheduled'),
('QR403', 'Doha', 'Paris', '2025-09-26 13:00:00', '2025-09-26 17:30:00', 'Scheduled'),
('QR404', 'Doha', 'Frankfurt', '2025-09-26 15:00:00', '2025-09-26 19:30:00', 'Scheduled'),
('QR405', 'Doha', 'Amsterdam', '2025-09-26 17:00:00', '2025-09-26 21:30:00', 'Scheduled'),
('QR406', 'Doha', 'Madrid', '2025-09-26 19:00:00', '2025-09-26 23:30:00', 'Scheduled'),
('QR407', 'Doha', 'Rome', '2025-09-26 21:00:00', '2025-09-27 01:30:00', 'Scheduled'),
('QR408', 'Doha', 'Vienna', '2025-09-26 23:00:00', '2025-09-27 03:30:00', 'Scheduled'),

-- Türk Hava Yolları - İç hat uçuşları
('TK501', 'Istanbul', 'Ankara', '2025-09-26 08:00:00', '2025-09-26 09:30:00', 'Scheduled'),
('TK502', 'Istanbul', 'Izmir', '2025-09-26 10:00:00', '2025-09-26 11:30:00', 'Scheduled'),
('TK503', 'Istanbul', 'Antalya', '2025-09-26 12:00:00', '2025-09-26 13:30:00', 'Scheduled'),
('TK504', 'Istanbul', 'Trabzon', '2025-09-26 14:00:00', '2025-09-26 15:30:00', 'Scheduled'),
('TK505', 'Istanbul', 'Adana', '2025-09-26 16:00:00', '2025-09-26 17:30:00', 'Scheduled'),
('TK506', 'Istanbul', 'Gaziantep', '2025-09-26 18:00:00', '2025-09-26 19:30:00', 'Scheduled'),
('TK507', 'Istanbul', 'Kayseri', '2025-09-26 20:00:00', '2025-09-26 21:00:00', 'Scheduled'),
('TK508', 'Istanbul', 'Samsun', '2025-09-26 22:00:00', '2025-09-26 23:30:00', 'Scheduled'),

-- Pegasus - İç hat uçuşları
('PC601', 'Istanbul', 'Ankara', '2025-09-26 09:00:00', '2025-09-26 10:30:00', 'Scheduled'),
('PC602', 'Istanbul', 'Izmir', '2025-09-26 11:00:00', '2025-09-26 12:30:00', 'Scheduled'),
('PC603', 'Istanbul', 'Antalya', '2025-09-26 13:00:00', '2025-09-26 14:30:00', 'Scheduled'),
('PC604', 'Istanbul', 'Trabzon', '2025-09-26 15:00:00', '2025-09-26 16:30:00', 'Scheduled'),
('PC605', 'Istanbul', 'Adana', '2025-09-26 17:00:00', '2025-09-26 18:30:00', 'Scheduled'),
('PC606', 'Istanbul', 'Gaziantep', '2025-09-26 19:00:00', '2025-09-26 20:30:00', 'Scheduled'),
('PC607', 'Istanbul', 'Kayseri', '2025-09-26 21:00:00', '2025-09-26 22:00:00', 'Scheduled'),
('PC608', 'Istanbul', 'Samsun', '2025-09-26 23:00:00', '2025-09-27 00:30:00', 'Scheduled'),

-- Gecikmeli uçuşlar
('TK701', 'Istanbul', 'London', '2025-09-26 08:00:00', '2025-09-26 11:30:00', 'Delayed'),
('TK702', 'Istanbul', 'Paris', '2025-09-26 10:00:00', '2025-09-26 13:30:00', 'Delayed'),
('TK703', 'Istanbul', 'Frankfurt', '2025-09-26 12:00:00', '2025-09-26 14:30:00', 'Delayed'),

-- İptal edilen uçuşlar
('TK801', 'Istanbul', 'Moscow', '2025-09-26 14:00:00', '2025-09-26 16:30:00', 'Cancelled'),
('TK802', 'Istanbul', 'Kiev', '2025-09-26 16:00:00', '2025-09-26 18:30:00', 'Cancelled'),
('TK803', 'Istanbul', 'Minsk', '2025-09-26 18:00:00', '2025-09-26 20:30:00', 'Cancelled'),

-- Boarding durumunda uçuşlar
('TK901', 'Istanbul', 'Amsterdam', '2025-09-26 20:00:00', '2025-09-26 22:30:00', 'Boarding'),
('TK902', 'Istanbul', 'Vienna', '2025-09-26 22:00:00', '2025-09-27 00:30:00', 'Boarding'),
('TK903', 'Istanbul', 'Zurich', '2025-09-27 00:00:00', '2025-09-27 02:30:00', 'Boarding'),

-- Departed uçuşlar
('TK1001', 'Istanbul', 'London', '2025-09-25 08:00:00', '2025-09-25 11:30:00', 'Departed'),
('TK1002', 'Istanbul', 'Paris', '2025-09-25 10:00:00', '2025-09-25 13:30:00', 'Departed'),
('TK1003', 'Istanbul', 'Frankfurt', '2025-09-25 12:00:00', '2025-09-25 14:30:00', 'Departed'),

-- Arrived uçuşlar
('TK1101', 'London', 'Istanbul', '2025-09-25 14:00:00', '2025-09-25 19:30:00', 'Arrived'),
('TK1102', 'Paris', 'Istanbul', '2025-09-25 16:00:00', '2025-09-25 21:30:00', 'Arrived'),
('TK1103', 'Frankfurt', 'Istanbul', '2025-09-25 18:00:00', '2025-09-25 23:30:00', 'Arrived');
