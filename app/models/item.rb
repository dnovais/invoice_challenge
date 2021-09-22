class Item < ApplicationRecord
  validates :name, :unit_cost, :quantity, presence: true
end
