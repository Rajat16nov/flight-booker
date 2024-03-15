# db/seeds.rb

# Clear the database (Be cautious with this command in real applications)
Airport.delete_all
Flight.delete_all

Airport.create(code: 'SFO')
Airport.create(code: 'NYC')

departure = Airport.find_by(code: 'SFO')
arrival = Airport.find_by(code: 'NYC')
Flight.create(departure_airport: departure, arrival_airport: arrival, start_datetime: DateTime.now, duration: 360)
Flight.create(
  departure_airport: departure,
  arrival_airport: arrival,
  start_datetime: DateTime.now + 1.day,
  duration: 360
)
Flight.create(
  departure_airport: departure,
  arrival_airport: arrival,
  start_datetime: DateTime.now - 1.day,
  duration: 360
)
