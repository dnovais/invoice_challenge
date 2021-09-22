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

  test 'when all data is empty' do
    # Arrange
    invoice = invoices(:one)

    payment = Payment.new
    payment.invoice_id = invoice.id
    payment.payment_kind = nil
    payment.status = nil

    # Act
    payment.valid?

    # Assert
    assert payment.errors.present?

    payment_errors = payment.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be blank", payment_errors[:amount])
    assert_equal("is not included in the list, can't be blank", payment_errors[:payment_kind])
    assert_equal("can't be blank", payment_errors[:payment_date])
    assert_equal("can't be blank, is not included in the list", payment_errors[:status])
  end

  test 'when payments payment_kind not exist on enum' do
    # arrange
    invoice = invoices(:one)
    amount = 6.00
    payment_kind = 'payment_kind_enum_not_valid'
    payment_date = Time.zone.today
    status = 0

    # act and assert
    assert_raises ArgumentError do
      Payment.create(
        invoice: invoice,
        amount: amount,
        payment_kind: payment_kind,
        payment_date: payment_date,
        status: status
      )
    end
  end

  test 'when payments status not exist on enum' do
    # arrange
    invoice = invoices(:one)
    amount = 6.00
    payment_kind = 'money'
    payment_date = Time.zone.today
    status = 'status_enum_not_valid'

    # act and assert
    assert_raises ArgumentError do
      Payment.create(
        invoice: invoice,
        amount: amount,
        payment_kind: payment_kind,
        payment_date: payment_date,
        status: status
      )
    end
  end
end
