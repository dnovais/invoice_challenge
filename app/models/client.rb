class Client < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
  validates :cpf, presence: true, uniqueness: true

  validate :cpf, :check_cpf_valid

  private

  def check_cpf_valid
    errors.add(:cpf, "the cpf: #{cpf} is not valid") unless CPF.valid?(cpf)
  end
end
