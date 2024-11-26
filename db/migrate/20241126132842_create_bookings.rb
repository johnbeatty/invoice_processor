class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.string :booking_code
      t.string :hotel_name
      t.string :traveller_name
      t.datetime :checkin
      t.datetime :checkout

      t.timestamps
    end
  end
end
