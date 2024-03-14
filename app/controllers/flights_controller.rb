class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [airport.code, airport.id] }
    @dates = Flight.all.map { |f| [f.start_datetime.strftime("%d/%m/%Y"), f.start_datetime.to_date] }.uniq
    @num_passengers = (1..4).to_a

    # Only perform the search if the search parameters are present
    if params[:departure_airport_id] && params[:arrival_airport_id] && params[:date]
      # Convert the date from string to a date object
      date = Date.parse(params[:date])
      # Find flights matching the search criteria
      @flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                              arrival_airport_id: params[:arrival_airport_id],
                              start_datetime: date.beginning_of_day..date.end_of_day)
    else
      @flights = Flight.none
    end
  end
end
