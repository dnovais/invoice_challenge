class Payment < ApplicationRecord
  belongs_to :invoice

  enum payment_kind: {
    money: 0,
    credit: 1,
    debit: 2,
    pix: 3
  }

  enum status: {
    waiting: 0,
    paid: 1,
    canceled: 2
  }

  validates :amount, :payment_date, :status, presence: true
  validates :payment_kind, inclusion: { in: payment_kinds.keys }, presence: true
  validates :status, inclusion: { in: statuses.keys }

  validate :payment_date, :payment_date_cannot_be_in_the_past

  private

  def payment_date_cannot_be_in_the_past
    errors.add(:payment_date, "can't be in the past") if payment_date.present? && payment_date < Time.zone.today
  end
end
