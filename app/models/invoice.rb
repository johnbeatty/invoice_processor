class Invoice < ApplicationRecord
  belongs_to :booking, optional: true
  has_one_attached :file
end
