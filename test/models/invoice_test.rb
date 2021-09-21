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
end
