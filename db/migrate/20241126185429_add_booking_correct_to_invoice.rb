class AddBookingCorrectToInvoice < ActiveRecord::Migration[8.0]
  def change
    add_column :invoices, :booking_correct, :boolean
    add_column :invoices, :receiving_correct, :boolean
    add_column :invoices, :invoicing_in_germany, :boolean
  end
end
