class AddNameOfCompanyToBooking < ActiveRecord::Migration[8.0]
  def change
    add_column :bookings, :name_of_company, :string
    add_column :bookings, :additional_address_information, :string
    add_column :bookings, :street_name, :string
    add_column :bookings, :street_number, :string
    add_column :bookings, :postal_code, :string
    add_column :bookings, :city, :string
    add_column :bookings, :country, :string
  end
end
