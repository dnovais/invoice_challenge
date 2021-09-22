require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  test 'when invoice belongs to one client and one company' do
    # arrange
    invoice = invoices(:one)
    client = clients(:one)
    company = companies(:one)

    # act
    invoice_client = invoice.client
    invoice_company = invoice.company

    # assert
    assert_equal invoice_client, client
    assert_equal invoice_company, company
  end

  test 'when invoice has many payments' do
    # arrange
    invoice = invoices(:one)

    # act
    invoice_payments = invoice.payments

    # assert
    assert_equal 2, invoice_payments.count
  end

  test 'when all data is empty' do
    # Arrange
    client = clients(:one)
    company = companies(:one)

    invoice = Invoice.new
    invoice.client_id = client.id
    invoice.company_id = company.id
    invoice.status = nil

    # Act
    invoice.valid?

    # Assert
    assert invoice.errors.present?

    invoice_errors = invoice.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be blank", invoice_errors[:title])
    assert_equal("can't be blank, is not included in the list", invoice_errors[:status])
    assert_equal("can't be blank", invoice_errors[:due_date])
  end

  test 'when invoices status not exist on enum' do
    # arrange
    company = companies(:one)
    client = clients(:one)
    title = 'Invoice 01'
    status = 'enum_not_valid'
    description = 'Sample of description'
    discount_percentage = 9.99
    discount_amount = 9.99
    tax_percentage = 9.99
    tax_amount = 9.99
    due_date = '2021-09-25'
    sub_total = 9.99
    total = 9.99

    # act and assert
    assert_raises ArgumentError do
      Invoice.create(
        company_id: company.id,
        client_id: client.id,
        title: title,
        status: status,
        description: description,
        discount_percentage: discount_percentage,
        discount_amount: discount_amount,
        tax_percentage: tax_percentage,
        tax_amount: tax_amount,
        due_date: due_date,
        sub_total: sub_total,
        total: total
      )
    end
  end

  test 'when invoices due_date is in the past' do
    # arrange
    company = companies(:one)
    client = clients(:one)
    title = 'Invoice 01'
    description = 'Sample of description'
    discount_percentage = 9.99
    discount_amount = 9.99
    tax_percentage = 9.99
    tax_amount = 9.99
    due_date = Time.zone.today - 1.day
    sub_total = 9.99
    total = 9.99

    # act
    invoice = Invoice.create(
      company_id: company.id,
      client_id: client.id,
      title: title,
      description: description,
      discount_percentage: discount_percentage,
      discount_amount: discount_amount,
      tax_percentage: tax_percentage,
      tax_amount: tax_amount,
      due_date: due_date,
      sub_total: sub_total,
      total: total
    )

    # assert
    assert invoice.errors.present?

    invoice_errors = invoice.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be in the past", invoice_errors[:due_date])
  end
end
