class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  before_action :set_invoice, only: [:show]

  def index
    @bookings = Booking.all
  end

  def edit
  end

  def update
    if params[:invoice_id]
      set_invoice
      @invoice.update invoice_booking_params
    else
      @booking.update booking_params
    end
    @booking.save
    respond_to do |format|
      format.html do
        if !@invoice.nil?
          redirect_to invoice_line_items_path(@invoice), notice: "Invoice saved"
        else
          redirect_to bookings_path, notice: "Booking saved"
        end
      end
    end
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

  def set_booking
    @booking = Booking.find params[:id]
  end

  def set_invoice
    @invoice = Invoice.find params[:invoice_id]
  end

  def invoice_booking_params
    params.require(:invoice).permit(:invoicing_in_germany, :booking_correct, :receiving_correct)
  end

  def booking_params
    params.require(:booking).permit(:booking_code, :hotel_name, :traveller_name, :checkin,
      :checkout, :name_of_company, :additional_address_information, :street_name, :street_number,
      :postal_code, :city, :country)
  end
end
