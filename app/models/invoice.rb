class Invoice < ApplicationRecord
  belongs_to :booking, optional: true
  has_one_attached :file
  has_many :line_items
  accepts_nested_attributes_for :line_items
end
