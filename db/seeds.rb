# db/seeds.rb

# Clear the database (Be cautious with this command in real applications)
Airport.delete_all
Flight.delete_all

# Create airports
sfo = Airport.create(code: 'SFO') # San Francisco
nyc = Airport.create(code: 'NYC') # New York City

# Create flights
Flight.create(departure_airport: sfo, arrival_airport: nyc, start_datetime: '2023-04-01 12:00', duration: 360)
Flight.create(departure_airport: nyc, arrival_airport: sfo, start_datetime: '2023-04-02 08:00', duration: 360)
