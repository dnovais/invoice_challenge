# frozen_string_literal: true

class Invoice::Find < Micro::Case
  attribute :params, validates: { kind: { respond_to: ActionController::Parameters } }

  def call!
    invoice = Invoice.find_by_id(params[:id])

    if invoice
      Success result: { invoice: invoice }
    else
      Failure(:invoice_not_found)
    end
  end
end
