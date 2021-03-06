require 'test_helper'

class InvoicesControllerShowTest < ActionDispatch::IntegrationTest
  test 'should respond with 404 when the invoice was not found' do
    get api_invoice_url(id: 1)

    assert_response 404

    assert_equal(
      { 'invoice' => { 'id' => 'not found' } },
      JSON.parse(response.body)
    )
  end

  test 'should respond with 200 when finds the record' do
    invoice = invoices(:draft)

    get api_invoice_url(id: invoice.id)

    assert_response 200

    invoice_json = JSON.parse(response.body)

    invoice = invoice_json['invoice']

    assert_equal(
      %w[
        id
        company_id
        client_id
        title
        status
        description
        discount_percentage
        discount_amount
        tax_percentage
        tax_amount
        due_date
        sub_total
        total
        created_at
        updated_at
        company
        client
        items
      ], invoice.keys
    )
  end
end
