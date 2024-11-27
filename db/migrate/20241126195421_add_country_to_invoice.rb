class AddCountryToInvoice < ActiveRecord::Migration[8.0]
  def change
    add_column :invoices, :country, :string
    add_column :invoices, :vat_id, :string
    add_column :invoices, :company_name, :string
    add_column :invoices, :invoice_date, :datetime
    add_column :invoices, :invoice_number, :string
    add_column :invoices, :street_name, :string
    add_column :invoices, :street_number, :string
    add_column :invoices, :postal_code, :string
    add_column :invoices, :city, :string
    add_column :invoices, :invoice_has_invoice, :boolean
  end
end
