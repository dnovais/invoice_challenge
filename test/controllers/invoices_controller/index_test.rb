require 'test_helper'

class InvoicesControllerIndexTest < ActionDispatch::IntegrationTest
  test 'should respond with 200 and all invoices when there is no status to filter' do
    get api_invoices_url

    assert_response 200

    invoices_json = JSON.parse(response.body)

    assert_equal(4, invoices_json['invoices'].size)

    invoices_json['invoices'].each do |invoice|
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
        ], invoice.keys
      )
    end
  end

  test 'should respond with 200 and all invoices with status draft when the status filter is draft' do
    get api_invoices_url, params: { status: 'draft' }

    assert_response 200

    invoices_json = JSON.parse(response.body)

    assert_equal(1, invoices_json['invoices'].size)

    assert(invoices_json['invoices'].all? { |invoice| invoice['status'] == 'draft' })

    invoices_json['invoices'].each do |invoice|
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
        ], invoice.keys
      )
    end
  end

  test 'should respond with 200 and all invoices with status sent when the status filter is sent' do
    get api_invoices_url, params: { status: 'sent' }

    assert_response 200

    invoices_json = JSON.parse(response.body)

    assert_equal(1, invoices_json['invoices'].size)

    assert(invoices_json['invoices'].all? { |invoice| invoice['status'] == 'sent' })

    invoices_json['invoices'].each do |invoice|
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
        ], invoice.keys
      )
    end
  end

  test 'should respond with 200 and all invoices with status paid when the status filter is paid' do
    get api_invoices_url, params: { status: 'paid' }

    assert_response 200

    invoices_json = JSON.parse(response.body)

    assert_equal(1, invoices_json['invoices'].size)

    assert(invoices_json['invoices'].all? { |invoice| invoice['status'] == 'paid' })

    invoices_json['invoices'].each do |invoice|
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
        ], invoice.keys
      )
    end
  end

  test 'should respond with 200 and all invoices with status closed when the status filter is closed' do
    get api_invoices_url, params: { status: 'closed' }

    assert_response 200

    invoices_json = JSON.parse(response.body)

    assert_equal(1, invoices_json['invoices'].size)

    assert(invoices_json['invoices'].all? { |invoice| invoice['status'] == 'closed' })

    invoices_json['invoices'].each do |invoice|
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
        ], invoice.keys
      )
    end
  end
end
