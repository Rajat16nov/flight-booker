class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [airport.code, airport.id] }
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:start_date].present?
      date = Date.parse(params[:start_date])
      @flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                              arrival_airport_id: params[:arrival_airport_id])
                      .select { |flight| flight.start_datetime.to_date == date }
    else
      @flights = Flight.none
    end
  end
end
