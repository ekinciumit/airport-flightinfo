using FlightInfo.Api.DTOs;

namespace FlightInfo.Api.Validators
{
    public static class FlightValidator
    {
        public static List<string> ValidateFlight(FlightDto flight)
        {
            var errors = new List<string>();

            if (string.IsNullOrWhiteSpace(flight.FlightNumber))
                errors.Add("Uçuş numarası gereklidir.");

            if (string.IsNullOrWhiteSpace(flight.Origin))
                errors.Add("Kalkış noktası gereklidir.");

            if (string.IsNullOrWhiteSpace(flight.Destination))
                errors.Add("Varış noktası gereklidir.");

            if (flight.DepartureTime >= flight.ArrivalTime)
                errors.Add("Kalkış saati varış saatinden önce olmalıdır.");

            if (flight.DepartureTime <= DateTime.Now)
                errors.Add("Kalkış saati geçmiş bir tarih olamaz.");

            return errors;
        }
    }
}
