class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    num_passengers = params[:num_passengers].to_i

    if num_passengers > 0
      num_passengers.times { @booking.passengers.build }
    else
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(booking: @booking, passenger: passenger).confirmation_email.deliver_later
      end
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
