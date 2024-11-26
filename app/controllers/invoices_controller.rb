class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update]

  def index
    @invoices = Invoice.all
    @invoice = Invoice.new
  end

  def show
  end

  def create
    @invoice = Invoice.create invoice_params
    respond_to do |format|
      format.html { redirect_to invoice_path(invoice) }
    end
  end

  def update
    @invoice.update attach_booking_params
    @invoice.save
    respond_to do |format|
      format.html { redirect_to invoice_path(@invoice) }
    end
  end

  protected

  def set_invoice
    @invoice = Invoice.find params[:id]
  end

  def invoice_params
    params.require(:invoice).permit(:file)
  end

  def attach_booking_params
    params.require(:invoice).permit(:booking_id)
  end
end
