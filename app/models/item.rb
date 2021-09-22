class Item < ApplicationRecord
  has_many :invoice_items

  validates :name, :unit_cost, :quantity, presence: true
end
