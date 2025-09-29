using FlightInfo.Api.Data;              // AppDbContext
using Microsoft.EntityFrameworkCore;
using FlightInfo.Api.Services;          // LogService
using FlightInfo.Api.Repositories;      // Repository
using FlightInfo.Api.Middleware;        // GlobalExceptionMiddleware
using FlightInfo.Api.Configuration;    // AppSettings
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// JWT ayarlarını oku
var jwtSettings = builder.Configuration.GetSection("Jwt");

// ✅ CORS policy ekle
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

// ✅ Authentication servislerini ekle
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = jwtSettings["Issuer"],
            ValidAudience = jwtSettings["Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(jwtSettings["Key"]!))
        };
    });

builder.Services.AddAuthorization();

// ✅ Servisleri ekle
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

// ✅ Swagger + JWT ayarları
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "FlightInfo.Api",
        Version = "v1"
    });

    // 🔑 JWT Security Definition
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Lütfen 'Bearer {token}' formatında giriniz",
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});

// ✅ Service Registration
builder.Services.AddScoped<ILogService, LogService>();
builder.Services.AddScoped<ICountryService, CountryService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IReservationService, ReservationService>();
builder.Services.AddScoped<IFlightService, FlightService>();
builder.Services.AddScoped<IUserService, UserService>();

// ✅ Repository Registration
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));

// Connection string'i appsettings.json'dan oku
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// ✅ DbContext'i servislere ekle
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(connectionString));

var app = builder.Build();

// ✅ Development ortamında Swagger aktif
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// app.UseHttpsRedirection(); // Geçici olarak kapatıldı

// ✅ Global Exception Handler
app.UseMiddleware<GlobalExceptionMiddleware>();

// ✅ CORS'u aktif et
app.UseCors("AllowAll");

// 🔑 Authentication → Authorization sırası doğru
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();