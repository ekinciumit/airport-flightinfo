namespace FlightInfo.Api.Services
{
    public interface ILogService
    {
        Task LogAsync(string action, int? userId, int? flightId = null);

    }
}
