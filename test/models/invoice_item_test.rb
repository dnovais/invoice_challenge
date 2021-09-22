require "test_helper"

class InvoiceItemTest < ActiveSupport::TestCase
  test 'when invoice item belongs to invoice and item' do
    # arrange
    invoice = invoices(:one)
    item = items(:one)
    invoice_item = invoice_items(:one)

    # act
    invoice_item_invoice = invoice_item.invoice
    invoice_item_item = invoice_item.item

    # assert
    assert_equal invoice_item_invoice, invoice
    assert_equal invoice_item_item, item
  end
end
