# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :cnpj, presence: true
end
