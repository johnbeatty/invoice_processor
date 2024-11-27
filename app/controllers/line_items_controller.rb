class LineItemsController < ApplicationController
  before_action :set_invoice

  def index
  end

  def create
    @invoice.update invoice_params
    @invoice.save
    respond_to do |format|
      format.html { redirect_to invoice_line_items_path(@invoice), alert: "Successfully save items." }
    end
  end

  protected

  def invoice_params
    params.require(:invoice).permit(:country, :vat_id, :company_name, :invoice_date,
      :invoice_number, :street_name, :street_number, :postal_code, :city, :invoice_has_invoice,
      {line_items_attributes: [:id, :name_of_traveler, :start_date, :end_date, :description,
        :category, :quantity, :price_currency, :price, :vat_rate, :_destroy]})
  end

  def set_invoice
    @invoice = Invoice.find params[:invoice_id]
  end
end
