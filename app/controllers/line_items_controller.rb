class LineItemsController < ApplicationController
  before_action :set_invoice

  def index
  end

  protected

  def set_invoice
    @invoice = Invoice.find params[:invoice_id]
  end
end
