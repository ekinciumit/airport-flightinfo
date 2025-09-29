-- FlightPrices tablosundaki Price sütununun precision'ını düzelt
-- Mevcut verileri koruyarak sadece decimal precision'ı güncelle

-- Önce mevcut Price sütununun tipini kontrol et
SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'FlightPrices' AND COLUMN_NAME = 'Price';

-- Price sütununu decimal(18,2) olarak güncelle
ALTER TABLE FlightPrices 
ALTER COLUMN Price DECIMAL(18,2);

-- Güncelleme sonrası kontrol
SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'FlightPrices' AND COLUMN_NAME = 'Price';
