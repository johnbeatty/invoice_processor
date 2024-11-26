class Booking < ApplicationRecord
  def to_combobox_display
    booking_code
  end

  def to_combobox_id
    id
  end
end
