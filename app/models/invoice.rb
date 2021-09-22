class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :client

  has_many :payments
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: {
    open: 0,
    closed: 1,
    paid: 2
  }

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :due_date, presence: true

  validate :due_date, :due_date_cannot_be_in_the_past

  private

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Time.zone.today
  end
end
