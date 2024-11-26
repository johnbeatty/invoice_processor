class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create booking_params
    @booking.save
    respond_to do |format|
      format.html { redirect_to bookings_path, notice: "Booking created!" }
    end
  end

  protected

  def booking_params
    params.require(:booking).permit(:booking_code, :hotel_name, :traveller_name, :checkin, :checkout)
  end
end
