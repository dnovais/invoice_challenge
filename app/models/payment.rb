class Payment < ApplicationRecord
  belongs_to :invoice

  enum payment_kind: {
    money: 0,
    credit: 1,
    debit: 2,
    pix: 3
  }

  validates :amount, :payment_date, :status, presence: true
  validates :payment_kind, inclusion: { in: payment_kinds.keys }, presence: true
end
