# FlightInfo Database Schema

## 📊 Database Tables & Relationships

### 🏗️ **Core Tables**

#### 1. **Users** (Kullanıcılar)
```sql
Id (int, PK)
Email (string, UNIQUE)
FullName (string)
PasswordHash (byte[])
PasswordSalt (byte[])
Role (enum: User=0, Admin=1)
CreatedAt (datetime)
IsDeleted (bool)
```

#### 2. **Countries** (Ülkeler)
```sql
Id (int, PK)
Code (string, UNIQUE) -- TR, DE, US
Name (string)
```

#### 3. **Cities** (Şehirler)
```sql
Id (int, PK)
Name (string)
CountryId (int, FK → Countries.Id)
FlightTime (string) -- "3-4 saat", "11 saat"
```

#### 4. **Airports** (Havalimanları)
```sql
Id (int, PK)
Code (string, UNIQUE) -- IST, SAW, JFK
Name (string)
CityId (int, FK → Cities.Id)
```

#### 5. **Flights** (Uçuşlar)
```sql
Id (int, PK)
FlightNumber (string)
Origin (string)
Destination (string)
DepartureTime (datetime)
ArrivalTime (datetime)
Status (string) -- "Scheduled", "Delayed", "Cancelled"
```

#### 6. **FlightPrices** (Uçuş Fiyatları)
```sql
Id (int, PK)
FlightId (int, FK → Flights.Id)
Class (string) -- "Economy", "Business", "First"
Price (decimal(18,2))
Currency (string) -- "TRY", "USD", "EUR"
AvailableSeats (int)
CreatedAt (datetime)
```

#### 7. **FlightStatusHistory** (Uçuş Durum Geçmişi)
```sql
Id (int, PK)
FlightId (int, FK → Flights.Id)
Status (string)
ChangedAt (datetime)
Reason (string, nullable)
```

#### 8. **Reservations** (Rezervasyonlar)
```sql
Id (int, PK)
UserId (int, FK → Users.Id)
FlightId (int, FK → Flights.Id)
Status (enum: Active=1, Cancelled=2)
CreatedAt (datetime)
CancelledAt (datetime, nullable)
```

#### 9. **Logs** (Sistem Logları)
```sql
Id (int, PK)
UserId (int, FK → Users.Id, nullable)
FlightId (int, FK → Flights.Id, nullable)
Action (string)
Timestamp (datetime)
```

---

## 🔗 **Database Relationships**

### **Hierarchical Structure:**
```
Countries (1) ──→ (N) Cities (1) ──→ (N) Airports
```

### **Flight Management:**
```
Flights (1) ──→ (N) FlightPrices
Flights (1) ──→ (N) FlightStatusHistory
```

### **User Operations:**
```
Users (1) ──→ (N) Reservations
Users (1) ──→ (N) Logs (nullable)
Flights (1) ──→ (N) Logs (nullable)
```

### **Reservation System:**
```
Users (1) ──→ (N) Reservations
Flights (1) ──→ (N) Reservations
```

---

## 📋 **Table Relationships Summary**

| Parent Table | Child Table | Relationship | Cascade Delete |
|--------------|-------------|--------------|----------------|
| Countries | Cities | One-to-Many | Yes |
| Cities | Airports | One-to-Many | Yes |
| Flights | FlightPrices | One-to-Many | Yes |
| Flights | FlightStatusHistory | One-to-Many | Yes |
| Users | Reservations | One-to-Many | Yes |
| Flights | Reservations | One-to-Many | Yes |
| Users | Logs | One-to-Many | Set Null |
| Flights | Logs | One-to-Many | Set Null |

---

## 🎯 **Key Constraints**

### **Unique Indexes:**
- `Users.Email` - Unique
- `Countries.Code` - Unique  
- `Airports.Code` - Unique
- `Reservations(UserId, FlightId, Status)` - Composite Index

### **Foreign Key Constraints:**
- All foreign keys have proper referential integrity
- Cascade delete for hierarchical data (Country → City → Airport)
- Set null for optional relationships (Logs)

### **Data Types:**
- `Price` - `DECIMAL(18,2)` for precise currency handling
- `DateTime` fields use UTC timezone
- `PasswordHash/Salt` - Byte arrays for security
- `Role` - Enum for type safety

---

## 🚀 **API Endpoints Available**

### **Authentication:**
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/refresh` - Token refresh

### **User Management:**
- `GET /api/users` - Get all users
- `GET /api/users/{id}` - Get user by ID
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user

### **Flight Operations:**
- `GET /api/flights` - Get all flights
- `GET /api/flights/{id}` - Get flight by ID
- `POST /api/flights` - Create flight
- `PUT /api/flights/{id}` - Update flight
- `DELETE /api/flights/{id}` - Delete flight

### **Reservation System:**
- `GET /api/reservations` - Get all reservations
- `GET /api/reservations/{id}` - Get reservation by ID
- `POST /api/reservations` - Create reservation
- `PUT /api/reservations/{id}` - Cancel reservation

### **Location Management:**
- `GET /api/countries` - Get all countries
- `GET /api/countries/{id}/cities` - Get cities by country
- `GET /api/cities/{id}/airports` - Get airports by city

### **Logging:**
- `GET /api/logs` - Get all logs
- `GET /api/logs/user/{userId}` - Get user logs
- `GET /api/logs/flight/{flightId}` - Get flight logs

---

## 🔧 **Database Connection**

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=FlightInfoDb;Trusted_Connection=True;TrustServerCertificate=True"
  }
}
```

## 🛡️ **Security Features**

- **JWT Authentication** with configurable expiration
- **Password Hashing** using salt + hash
- **Role-based Authorization** (User/Admin)
- **CORS Configuration** for cross-origin requests
- **Input Validation** on all endpoints

---

## 📊 **Sample Data Structure**

### **Countries:**
- Turkey (TR)
- Germany (DE)  
- United States (US)

### **Cities:**
- Istanbul, Turkey
- Berlin, Germany
- New York, United States

### **Airports:**
- IST (Istanbul Airport)
- SAW (Sabiha Gökçen)
- JFK (John F. Kennedy)

### **Flight Classes:**
- Economy
- Business  
- First Class

### **Flight Status:**
- Scheduled
- Delayed
- Cancelled
- Completed

---

**Database Status:** ✅ Active and Ready  
**Migration Status:** ✅ All migrations applied  
**API Status:** ✅ All endpoints functional  
**Authentication:** ✅ JWT configured  
**CORS:** ✅ Configured for frontend integration
