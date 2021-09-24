# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :client

  has_many :payments
  has_many :invoice_items
  has_many :items, through: :invoice_items

  accepts_nested_attributes_for :items

  enum status: {
    draft: 0,
    sent: 1,
    paid: 2,
    closed: 3
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
