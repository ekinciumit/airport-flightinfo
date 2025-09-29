using FlightInfo.Api.Data;
using FlightInfo.Api.DTOs;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Services
{
    public class CountryService : ICountryService
    {
        private readonly AppDbContext _context;

        public CountryService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<CountryDto>> GetCountriesAsync()
        {
            var countries = await _context.Countries
                .Include(c => c.Cities)
                    .ThenInclude(city => city.Airports)
                .Select(c => new CountryDto
                {
                    Id = c.Id,
                    Code = c.Code,
                    Name = c.Name,
                    Cities = c.Cities.Select(city => new CityDto
                    {
                        Id = city.Id,
                        Name = city.Name,
                        CountryId = city.CountryId,
                        FlightTime = city.FlightTime,
                        Airports = city.Airports.Select(airport => new AirportDto
                        {
                            Id = airport.Id,
                            Code = airport.Code,
                            Name = airport.Name,
                            CityId = airport.CityId
                        }).ToList()
                    }).ToList()
                })
                .ToListAsync();

            // Encoding sorununu düzelt
            foreach (var country in countries)
            {
                country.Name = FixCountryName(country.Code, country.Name);
                
                // Şehir isimlerini düzelt
                foreach (var city in country.Cities)
                {
                    city.Name = FixCityName(city.Name);
                    
                    // Havalimanı isimlerini düzelt
                    foreach (var airport in city.Airports)
                    {
                        airport.Name = FixAirportName(airport.Name);
                    }
                }
            }

            return countries;
        }

        public async Task<IEnumerable<CityDto>> GetCountryCitiesAsync(int countryId)
        {
            var cities = await _context.Cities
                .Where(c => c.CountryId == countryId)
                .Select(c => new CityDto
                {
                    Id = c.Id,
                    Name = c.Name,
                    CountryId = c.CountryId,
                    FlightTime = c.FlightTime,
                    Airports = c.Airports.Select(airport => new AirportDto
                    {
                        Id = airport.Id,
                        Code = airport.Code,
                        Name = airport.Name,
                        CityId = airport.CityId
                    }).ToList()
                })
                .ToListAsync();

            // Encoding sorununu düzelt
            foreach (var city in cities)
            {
                city.Name = FixCityName(city.Name);
                foreach (var airport in city.Airports)
                {
                    airport.Name = FixAirportName(airport.Name);
                }
            }

            return cities;
        }

        public async Task<IEnumerable<AirportDto>> GetCityAirportsAsync(int cityId)
        {
            var airports = await _context.Airports
                .Where(a => a.CityId == cityId)
                .Select(a => new AirportDto
                {
                    Id = a.Id,
                    Code = a.Code,
                    Name = a.Name,
                    CityId = a.CityId
                })
                .ToListAsync();

            // Encoding sorununu düzelt
            foreach (var airport in airports)
            {
                airport.Name = FixAirportName(airport.Name);
            }

            return airports;
        }

        public async Task<CountryDto?> GetCountryAsync(int id)
        {
            var country = await _context.Countries
                .Include(c => c.Cities)
                    .ThenInclude(city => city.Airports)
                .Where(c => c.Id == id)
                .Select(c => new CountryDto
                {
                    Id = c.Id,
                    Code = c.Code,
                    Name = c.Name,
                    Cities = c.Cities.Select(city => new CityDto
                    {
                        Id = city.Id,
                        Name = city.Name,
                        CountryId = city.CountryId,
                        FlightTime = city.FlightTime,
                        Airports = city.Airports.Select(airport => new AirportDto
                        {
                            Id = airport.Id,
                            Code = airport.Code,
                            Name = airport.Name,
                            CityId = airport.CityId
                        }).ToList()
                    }).ToList()
                })
                .FirstOrDefaultAsync();

            if (country != null)
            {
                country.Name = FixCountryName(country.Code, country.Name);
                
                foreach (var city in country.Cities)
                {
                    city.Name = FixCityName(city.Name);
                    foreach (var airport in city.Airports)
                    {
                        airport.Name = FixAirportName(airport.Name);
                    }
                }
            }

            return country;
        }

        // ✅ Algoritmalar artık service'de
        private string FixCountryName(string code, string name)
        {
            return code switch
            {
                "TR" => "Türkiye",
                "GB" => "İngiltere", 
                "IT" => "İtalya",
                "ES" => "İspanya",
                "CH" => "İsviçre",
                "AE" => "Birleşik Arap Emirlikleri",
                _ => name
            };
        }

        private string FixCityName(string name)
        {
            return name switch
            {
                "Ä°stanbul" => "İstanbul",
                "Ä°zmir" => "İzmir",
                "MÃ¼nih" => "Münih",
                "KÃ¶ln" => "Köln",
                "DÃ¼sseldorf" => "Düsseldorf",
                "NÃ¼rnberg" => "Nürnberg",
                "MÃ¡laga" => "Málaga",
                "ZÃ¼rih" => "Zürih",
                "Sankt PÃ¶lten" => "Sankt Pölten",
                "ÅŸarika" => "Şarika",
                "FÃ¼ceyre" => "Füceyre",
                "HiroÅŸima" => "Hiroşima",
                _ => name
            };
        }

        private string FixAirportName(string name)
        {
            return name switch
            {
                "Ä°stanbul HavalimanÄ±" => "İstanbul Havalimanı",
                "Sabiha GÃ¶kÃ§en HavalimanÄ±" => "Sabiha Gökçen Havalimanı",
                "EsenboÄŸa HavalimanÄ±" => "Esenboğa Havalimanı",
                "Adnan Menderes HavalimanÄ±" => "Adnan Menderes Havalimanı",
                "Antalya HavalimanÄ±" => "Antalya Havalimanı",
                "Trabzon HavalimanÄ±" => "Trabzon Havalimanı",
                "Berlin Brandenburg HavalimanÄ±" => "Berlin Brandenburg Havalimanı",
                "SchÃ¶nefeld HavalimanÄ±" => "Schönefeld Havalimanı",
                "MÃ¼nih HavalimanÄ±" => "Münih Havalimanı",
                "Frankfurt HavalimanÄ±" => "Frankfurt Havalimanı",
                "Charles de Gaulle HavalimanÄ±" => "Charles de Gaulle Havalimanı",
                "Orly HavalimanÄ±" => "Orly Havalimanı",
                "Heathrow HavalimanÄ±" => "Heathrow Havalimanı",
                "Gatwick HavalimanÄ±" => "Gatwick Havalimanı",
                "Stansted HavalimanÄ±" => "Stansted Havalimanı",
                "Fiumicino HavalimanÄ±" => "Fiumicino Havalimanı",
                "Malpensa HavalimanÄ±" => "Malpensa Havalimanı",
                "Barajas HavalimanÄ±" => "Barajas Havalimanı",
                "El Prat HavalimanÄ±" => "El Prat Havalimanı",
                "Schiphol HavalimanÄ±" => "Schiphol Havalimanı",
                "Viyana HavalimanÄ±" => "Viyana Havalimanı",
                "Linz HavalimanÄ±" => "Linz Havalimanı",
                "ZÃ¼rih HavalimanÄ±" => "Zürih Havalimanı",
                "John F. Kennedy HavalimanÄ±" => "John F. Kennedy Havalimanı",
                "LaGuardia HavalimanÄ±" => "LaGuardia Havalimanı",
                "Newark HavalimanÄ±" => "Newark Havalimanı",
                "Los Angeles HavalimanÄ±" => "Los Angeles Havalimanı",
                "Dubai HavalimanÄ±" => "Dubai Havalimanı",
                "Narita HavalimanÄ±" => "Narita Havalimanı",
                "Haneda HavalimanÄ±" => "Haneda Havalimanı",
                _ => name
            };
        }
    }
}
