class BookingsController < ApplicationController
  def index
      @bookings = Booking.all
  end
  def show
    @booking = Booking.find(params[:id])
  end
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.venue = Venue.find(params[:venue_id])
    if @booking.save
      redirect_to venue_path(@booking.venue), notice: "Booking Done"
    else
      redirect_to venue_path(@booking.venue), alert: "Please fill out all fields"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path
  end
  def destroy
    @booking= Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end
  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
