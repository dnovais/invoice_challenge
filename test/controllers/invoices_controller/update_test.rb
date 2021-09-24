require 'test_helper'

class InvoicesControllerUpdateTest < ActionDispatch::IntegrationTest
  test 'should respond with 422 when receives invalid params' do
    invoice = invoices(:draft)

    invoice_params = {
      "invoice": {
        "company_id": 123
      }
    }

    put api_invoice_url(invoice), params: invoice_params

    assert_response 422

    assert_equal(
      {
        'invoice' =>
        {
          'company' => ['must exist']
        }
      }, JSON.parse(response.body)
    )
  end

  test 'should respond with 201 when receives valid params' do
    invoice = invoices(:draft)

    previous_title = invoice.title
    previous_tax_percentage = invoice.tax_percentage
    previous_tax_amount = invoice.tax_amount

    invoice_params = {
      "invoice": {
        "title": 'Invoice 01 updated',
        "tax_percentage": 0.0,
        "tax_amount": 0.0
      }
    }

    put api_invoice_url(invoice), params: invoice_params

    assert_response 201

    invoice_json = JSON.parse(response.body)

    refute_equal(invoice_json.dig('invoice', 'id'), previous_title)
    refute_equal(invoice_json.dig('invoice', 'id'), previous_tax_percentage)
    refute_equal(invoice_json.dig('invoice', 'id'), previous_tax_amount)
  end
end
