require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  test 'when payment belongs to invoice' do
    # arrange
    invoice = invoices(:one)
    payment = payments(:one)

    # act
    payment_invoice = payment.invoice

    # assert
    assert_equal payment_invoice, invoice
  end
end
