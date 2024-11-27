class LineItem < ApplicationRecord
  belongs_to :invoice
  monetize :price_cents
end
