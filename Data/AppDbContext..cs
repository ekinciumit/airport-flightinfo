using FlightInfo.Api.Domain;
using Microsoft.EntityFrameworkCore;

namespace FlightInfo.Api.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<User> Users => Set<User>();
        public DbSet<Flight> Flights => Set<Flight>();
        public DbSet<Log> Logs => Set<Log>();
        public DbSet<Reservation> Reservations => Set<Reservation>();

        // Location entities
        public DbSet<Country> Countries => Set<Country>();
        public DbSet<City> Cities => Set<City>();
        public DbSet<Airport> Airports => Set<Airport>();

        // Flight search entities
        public DbSet<FlightPrice> FlightPrices => Set<FlightPrice>();
        public DbSet<FlightStatusHistory> FlightStatusHistory => Set<FlightStatusHistory>();


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Email için unique index
            modelBuilder.Entity<User>()
                  .HasIndex(u => u.Email)
                  .IsUnique();

            // Log -> User (nullable)
            modelBuilder.Entity<Log>()
                .HasOne(l => l.User)
                .WithMany()                   // User.Logs koleksiyonu yok
                .HasForeignKey(l => l.UserId)
                .IsRequired(false)
                .OnDelete(DeleteBehavior.SetNull);

            // Log -> Flight (nullable)
            modelBuilder.Entity<Log>()
                .HasOne(l => l.Flight)
                .WithMany()                   // Flight.Logs koleksiyonu yok
                .HasForeignKey(l => l.FlightId)
                .IsRequired(false)
                .OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<Reservation>()
                .HasOne(r => r.User)
                .WithMany() // kullanıcıdan rezervasyon koleksiyonu tutmuyoruz
                .HasForeignKey(r => r.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Reservation>()
                .HasOne(r => r.Flight)
                .WithMany() // Flight'tan rezervasyon koleksiyonu tutmuyoruz
                .HasForeignKey(r => r.FlightId)
                .OnDelete(DeleteBehavior.Cascade);

            // Aynı kullanıcı + aynı uçuş için birden fazla aktif rezervasyonu engelle (opsiyonel ama faydalı)
            modelBuilder.Entity<Reservation>()
                .HasIndex(r => new { r.UserId, r.FlightId, r.Status });

            // Country -> City -> Airport relationships
            modelBuilder.Entity<Country>()
                .HasMany(c => c.Cities)
                .WithOne(c => c.Country)
                .HasForeignKey(c => c.CountryId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<City>()
                .HasMany(c => c.Airports)
                .WithOne(a => a.City)
                .HasForeignKey(a => a.CityId)
                .OnDelete(DeleteBehavior.Cascade);

            // Unique constraints
            modelBuilder.Entity<Country>()
                .HasIndex(c => c.Code)
                .IsUnique();

            modelBuilder.Entity<Airport>()
                .HasIndex(a => a.Code)
                .IsUnique();

            // FlightPrice decimal precision (sadece uyarıyı gidermek için)
            modelBuilder.Entity<FlightPrice>()
                .Property(fp => fp.Price)
                .HasPrecision(18, 2);
        }
    }
}