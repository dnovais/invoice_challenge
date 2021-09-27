# frozen_string_literal: true

class Invoice::SendEmail < Micro::Case
  attributes :invoice

  def call!
    InvoiceMailer.with(invoice: invoice).confirmation.deliver_later

    Success result: { invoice: invoice }
  end
end
