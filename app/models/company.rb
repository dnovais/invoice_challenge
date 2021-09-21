# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true

  validate :cnpj, :check_cnpj_valid

  has_many :invoices

  private

  def check_cnpj_valid
    errors.add(:cnpj, "the cnpj: #{cnpj} is not valid") unless CNPJ.valid?(cnpj)
  end
end
