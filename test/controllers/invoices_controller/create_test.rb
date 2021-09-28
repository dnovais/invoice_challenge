require 'test_helper'

class InvoicesControllerCreateTest < ActionDispatch::IntegrationTest
  test 'should respond with 422 when receives invalid params' do
    invoice_params = {
      'invoice': {
        'company_id': 123
      }
    }

    post api_invoices_url, params: invoice_params

    assert_response 422

    assert_equal(
      {
        'invoice' =>
        {
          'company' => ['must exist'],
          'client' => ['must exist'],
          'title' => ["can't be blank"],
          'due_date' => ["can't be blank"]
        }
      }, JSON.parse(response.body)
    )
  end

  test 'should respond with 201 when receives valid params' do
    company = companies(:one)
    client = clients(:one)

    invoice_params = {
      'invoice': {
        'company_id': company.id,
        'client_id': client.id,
        'title': 'Invoice 01',
        'status': 'draft',
        'description': 'Sample of description',
        'discount_percentage': 9.99,
        'discount_amount': 9.99,
        'tax_percentage': 9.99,
        'tax_amount': 9.99,
        'due_date': Time.zone.today + 1.day,
        'sub_total': 9.99,
        'total': 9.99,
        'items_attributes': [
          {
            'name': 'A item sample name',
            'description': 'A item sample description',
            'unit_cost': 10.0,
            'quantity': 1
          },
          {
            'name': 'Another item sample name',
            'description': 'Another item sample description',
            'unit_cost': 10.0,
            'quantity': 1
          }
        ],
        'company_attributes': {
          'name': 'Anthony e Raimundo Restaurante ME',
          'email': 'contato@arrestaurante.com.br',
          'cnpj': '53.907.058/0001-80',
          'address': 'Rua 14',
          'phone': '(64) 2670-4462'
        },
        'client_attributes': {
          'name': 'Marli Patrícia',
          'email': 'Marli.almada@domain.com.br',
          'cpf': '310.744.880-08',
          'address': 'Rua Cuite',
          'phone': '(83) 2689-2075'
        }
      }
    }

    post api_invoices_url, params: invoice_params

    assert_response 201

    invoice_json = JSON.parse(response.body)

    last_invoice = Invoice.last

    assert_equal(invoice_json.dig('invoice', 'id'), last_invoice.id)
  end
end
